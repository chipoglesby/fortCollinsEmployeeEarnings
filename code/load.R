library(tidyverse)
library(magrittr)

# Load the data into a data frame using reader.
salary <- read_csv("data/salaries.csv")

# Give the data better names
names(salary) <- c("title", "department", "earnings")

# Lowercase all names for consistency
salary %<>%
  transmute(title = tolower(title),
           department = tolower(department),
           earnings = 
             as.numeric(gsub('(\\$)|(\\,)','', earnings)))