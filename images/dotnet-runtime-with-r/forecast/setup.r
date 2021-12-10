install.packages("remotes", repo = "https://cran.r-project.org/")

install.packages("forecast", repo = "https://cran.r-project.org/", dependencies = TRUE)

install.packages("Metrics", repo = "https://cran.r-project.org/")

remotes::install_github("tidyverse/readxl")

sessionInfo()

installed.packages(fields = c("Package", "Version"))

library("forecast")

library("readxl")

library("Metrics")
