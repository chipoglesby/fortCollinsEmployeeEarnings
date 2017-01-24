## First, let's clean the data.

# ---- clean ----
# Give the data better names
names(salaries) <- c("jobTitle", "division", "earnings")

# Lowercase all names for consistency
salaries %<>%
  transmute(jobTitle = tolower(jobTitle),
            division = tolower(division),
            earnings = 
              as.numeric(gsub('(\\$)|(\\,)','', earnings)),
            year = 2015,
            department = "") %>% 
  mutate(department = 
  replace(department,
  grepl("office of the chief|patrol|investigative|information services",
        division), "police"))

## Next, let's ask some questions

# ---- questions ----
# Who is the highest paid employye in each department?
highest <- salaries %>% 
  group_by(department) %>% 
  filter(earnings == max(earnings))

## Let's look at one specific department, like police
# ---- police ----

# Subsetting police
police <- salaries %<>%
  filter(grepl("office of the chief|patrol|investigative|information services", division)) %>% 
  mutate(department = "police")

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
# salaries %>%
#   ggplot(aes(department, median(earnings))) +
#   geom_bar(stat = identity)


median <- salaries %>%
  group_by(department) %>% 
  summarize(positionCount = length(jobTitle),
            mediansalaries = round(median(earnings), 2)) %>% 
  arrange(desc(mediansalaries))

median <- salaries %>%
  group_by(department, jobTitle) %>%
  summarize(positionCount = length(jobTitle),
            mediansalaries = round(median(earnings), 2)) %>% 
  arrange(department, desc(mediansalaries))

# salaries %>% 
#   group_by(department) %>% 
#   summarize(total = sum(earnings)) %>% 
#   ggplot(aes(department, total)) +
#   geom_bar(stat = identity)