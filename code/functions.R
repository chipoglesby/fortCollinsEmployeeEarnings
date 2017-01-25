## First, let's clean the data.

# ---- clean ----
# Give the data better names
names(salaries) <- c("jobTitle", "department", "earnings")

# Lowercase all names for consistency
salaries %<>%
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
      purchasing|risk mgmt|airport|safety|finance admin",department),
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
      replace(serviceArea,grepl("library",department), "library services"),
    serviceArea = 
      replace(serviceArea,grepl("fire",department), "poudre fire authority"),
    hourlyWage = 
      ifelse(earnings > 17056, as.numeric(round(earnings/2080, 2)), NA),
    status = ifelse(is.na(hourlyWage) == TRUE, "part time", "full time")
      )

unknown <- salaries %>% 
  filter(serviceArea == 'unknown') %>% 
  distinct(department) %>% 
  arrange(department)
## Next, let's ask some questions

# ---- questions ----
# Who is the highest paid employye in each serviceArea?
highest <- salaries %>% 
  group_by(serviceArea) %>% 
  filter(earnings == max(earnings))

## Let's look at one specific serviceArea, like police
# ---- police ----

# Subsetting police
police <- salaries %>%
  filter(serviceArea == 'police services') %>% 
  group_by(jobTitle) %>% 
  summarize(
            employeeCount = n(),
            medianSalary = median(earnings),
            meanSalary = mean(earnings),
            maxSalary = max(earnings),
            minSalary = min(earnings))

police %>% 
  group_by(department) %>%
  summarize(
    minsalaries = min(earnings),
    mediansalaries = median(earnings),
    maxsalaries = max(earnings),
    count = n()) %>% 
  arrange(desc(mediansalaries))

police %>% 
  ggplot(aes(earnings)) +
  geom_histogram(bins = 100)

# ---- policeCount ----
police %>% 
  summarize(count = n())

# ---- generalWork ----

median <- salaries %>%
  group_by(serviceArea) %>% 
  summarize(positionCount = length(jobTitle),
            mediansalaries = round(median(earnings), 2)) %>% 
  arrange(desc(mediansalaries))