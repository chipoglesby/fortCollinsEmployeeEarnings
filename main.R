Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc')
# Load most commonly used libraries

library(tidyverse)

# ---- begin ----
# Step One: Load Data from Google Big Query:
source("code/load.R")

# ---- analysis ----
# Step Two: Analyzing data for report:
source("code/functions.R")

# ---- knit ----
# Step Three: Knitting Report
# rmarkdown::render("rmd/police.Rmd", "github_document", "../analysis/police.md")
rmarkdown::render("rmd/README.Rmd", "github_document", "../README.md")
