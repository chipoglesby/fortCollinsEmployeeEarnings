## First, let's ask some questions

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