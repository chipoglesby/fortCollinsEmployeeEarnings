## First, let's clean the data.

# ---- clean ----
# Give the data better names
names(salaries) <- c("jobTitle", "department", "earnings2015")

# Lowercase all names for consistency
salaries %<>%
  transmute(jobTitle = tolower(jobTitle),
            department = tolower(department),
            earnings2015 = 
              as.numeric(gsub('(\\$)|(\\,)','', earnings2015)))

## Next, let's ask some questions

# ---- questions ----
# Who is the highest paid employye in each department?
highest <- salaries %>% 
  group_by(department) %>% 
  filter(earnings == max(earnings))

## Let's look at one specific department, like police
# ---- police ----
salaries %>% 
  filter(department == "patrol") %>% 
  group_by(jobTitle) %>%
  summarize(
    minsalaries = min(earnings),
    mediansalaries = median(earnings),
    maxsalaries = max(earnings),
    count = n()) %>% 
  arrange(desc(mediansalaries))

salaries %>% 
  filter(department == "patrol" & jobTitle == 'police officer') %>%
  ggplot(aes(earnings)) +
  geom_histogram(bins = 35)

# ---- policeCount ----
salaries %>% 
  filter(department == 'patrol') %>% 
  summarize(count = n())



# ---- generalWork ----
salaries %>%
  ggplot(aes(department, median(earnings2015))) +
  geom_bar(stat = identity)


median <- salaries %>%
  group_by(department) %>% 
  summarize(positionCount = length(jobTitle),
            mediansalaries = round(median(earnings2015), 2)) %>% 
  arrange(desc(weightedMediansalaries))

median <- salaries %>%
  group_by(department, jobTitle) %>%
  summarize(positionCount = length(jobTitle),
            mediansalaries = round(median(earnings2015), 2)) %>% 
  arrange(department, desc(mediansalaries))

salaries %>% 
  group_by(department) %>% 
  summarize(total = sum(earnings2015)) %>% 
  ggplot(aes(department, total)) +
  geom_bar(stat = identity)