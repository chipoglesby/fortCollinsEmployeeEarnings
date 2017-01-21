# ---- police ----
salary %>% 
  filter(department == "patrol") %>% 
  group_by(title) %>%
  summarize(
    minSalary = min(earnings),
    medianSalary = median(earnings),
    maxSalary = max(earnings),
    count = n()) %>% 
  arrange(desc(medianSalary))

salary %>% 
  filter(department == "patrol" & title == 'police officer') %>%
  ggplot(aes(earnings)) +
  geom_histogram(bins = 35)

# ---- policeCount ----
salary %>% 
  filter(department == 'patrol') %>% 
  summarize(count = n())

# ---- generalWork ----
names(salaries) <- c("jobTitle", "department", "earnings2015")

salaries <- salaries %>%
  mutate(jobTitle = tolower(jobTitle), 
         department = tolower(department),
         earnings2015 = 
           as.numeric(
             str_replace_all(earnings2015, "[\\$]|[\\,]",""))) %>%
  ggplot(aes(department, median(earnings2015))) +
  geom_bar(stat = identity)


median <- salaries %>%
  group_by(department) %>% 
  summarize(positionCount = length(jobTitle),
            medianSalary = round(median(earnings2015), 2),
            weightedMedianSalary = round(median(earnings2015)/sum(positionCount), 2)) %>% 
  arrange(desc(weightedMedianSalary))

median <- salaries %>%
  group_by(department, jobTitle) %>%
  summarize(positionCount = length(jobTitle),
            medianSalary = round(median(earnings2015), 2)) %>% 
  arrange(department, desc(medianSalary))

salaries %>% 
  group_by(department) %>% 
  summarize(total = sum(earnings2015)) %>% 
  ggplot(aes(department, total)) +
  geom_bar(stat = identity)