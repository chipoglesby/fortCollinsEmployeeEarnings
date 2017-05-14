Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc')
# Load most commonly used libraries

library(tidyverse)

# ---- begin ----
# Step One: Load Data:
source("code/load2015.R")

# ---- analysis ----
# Step Two: Analyzing data for report:
source("code/functions.R")

# ---- knit ----
# Step Three: Knitting Report
source("code/reports.R")