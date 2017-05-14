library(tidyverse)
library(magrittr)

# Frist, let's load the data into a data frame using reader.
salaries2015 <- read_csv("data/raw/salaries2015.csv")
## Second, let's clean the data.

# ---- clean ----
# Give the data better names
names(salaries2015) <- c("jobTitle", "department", "earnings")

# Lowercase all names for consistency
salaries2015 %<>%
  transmute(jobTitle = tolower(jobTitle),
            department = tolower(department),
            earnings = 
              as.numeric(gsub('(\\$)|(\\,)','', earnings)),
            year = 2015,
            serviceArea = "") %>% 
  mutate(
    serviceArea = 
      replace(serviceArea,grepl("",serviceArea), "unknown"),
    serviceArea = 
      replace(serviceArea,grepl("office of the chief|patrol|investigative|\
                                information services|investigations",department), "police services"),
    serviceArea = 
      replace(serviceArea,grepl("accounting and treasury|budget|revenue|\
                                purchasing|risk mgmt|airport|safety|finance admin|sales tax",department),
              "financial services"),
    serviceArea = 
      replace(serviceArea,grepl("information technology|human resources|\
                                public involvement",department), "information and employee services"),
    serviceArea = 
      replace(serviceArea,grepl("water|electric|utility|customer connections|\
                                ^ut|^l&p",department), "utility services"),
    serviceArea = 
      replace(serviceArea,grepl("economic health|^environmental|social \
                                sustainability|sustainability services admin",department), 
              "sustainability services"),
    serviceArea = 
      replace(serviceArea,grepl("cultural services|recreation|parks|natural \
                                areas|park planning|operation services|community services admin", 
                                department), "community and operation services"),
    serviceArea = 
      replace(serviceArea,grepl("^city manager\'s",department), "city manager"),
    serviceArea = 
      replace(serviceArea,grepl("city attorney",department), "city attorney"),
    serviceArea = 
      replace(serviceArea,grepl("comm dev|streets|engineering|fc moves|transfort|\
                                ^traffic$|parking|^pdt",department), "planning development & transportation"),
    serviceArea =
      replace(serviceArea,grepl("city clerk",department), "deputy city manager"),
    serviceArea =
      replace(serviceArea,grepl("municipal court",department), "judicial services"),
    hourlyWage = 
      ifelse(earnings > 17056, as.numeric(round(earnings/2080, 2)), NA),
    status = ifelse(is.na(hourlyWage) == TRUE, "part time", "full time")
      )

salaries2015 %<>%
  filter(serviceArea != "unknown")

write_csv(salaries2015, "data/clean/salaries2015.csv")