#!/usr/bin/env bash

cat <<EOF >> /var/lib/cassandra/init-user.sql
CREATE ROLE IF NOT EXISTS $CASSANDRA_USERNAME
    WITH PASSWORD = '$CASSANDRA_PASSWORD'
        AND LOGIN = true
        AND SUPERUSER = true;

GRANT ALL PERMISSIONS ON ALL KEYSPACES TO $CASSANDRA_USERNAME;
EOF

cat <<'EOF' >> /run-user-init.sh
#!/usr/bin/env bash
(
    LOCK=/var/lib/cassandra/.user_initialized

    if [ -f "$LOCK" ]; then
        echo "Cassandra user init script has already run"

        exit 0
    fi

    while ! cqlsh -u cassandra -p cassandra -e 'describe cluster' > /dev/null 2>&1;
    do
        echo "Waiting for Cassandra to finish startup..."

        sleep 3
    done

    echo "Init Cassandra $CASSANDRA_USERNAME user..."

    cqlsh -u cassandra -p cassandra -f /var/lib/cassandra/init-user.sql

    echo "Delete default Cassandra user..."

    cqlsh -u $CASSANDRA_USERNAME -p $CASSANDRA_PASSWORD -e 'DROP ROLE cassandra;'

    rm -f /var/lib/cassandra/init-user.sql

    touch $LOCK
) &
EOF

# Patch existing entrypoint to call our script in the background
# This has been inspired by https://www.thetopsites.net/article/51594713.shtml
ENTRYPOINT=/patched-entrypoint.sh

sed '$ d' /docker-entrypoint.sh > $ENTRYPOINT

cat <<'EOF' >> $ENTRYPOINT
/run-user-init.sh &

exec "$@"
EOF

# Make both scripts executable
chmod +x /run-user-init.sh
chmod +x $ENTRYPOINT

export CASSANDRA_CLUSTER_NAME=${CASSANDRA_CLUSTER_NAME:-Container Cluster}
export CASSANDRA_PORT=${CASSANDRA_PORT:-9042}
export CASSANDRA_RPC_PORT=${CASSANDRA_RPC_PORT:-9160}

envsubst < /etc/cassandra/cassandra.yaml.template > /etc/cassandra/cassandra.yaml

# Call the new entrypoint
$ENTRYPOINT "$@"
