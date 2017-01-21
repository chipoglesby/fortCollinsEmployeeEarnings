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
  filter(earnings2015 == max(earnings2015))

## Let's look at one specific department, like police
# ---- police ----

# Subsetting police
police <- salaries %>%
  filter(grepl("office of the chief|patrol|investigative|information services", department)) %>% 
  mutate(departmentProper = "police")

police %>% 
  group_by(department) %>%
  summarize(
    minsalaries = min(earnings2015),
    mediansalaries = median(earnings2015),
    maxsalaries = max(earnings2015),
    count = n()) %>% 
  arrange(desc(mediansalaries))

police %>% 
  ggplot(aes(earnings2015)) +
  geom_histogram(bins = 100)

# ---- policeCount ----
police %>% 
  summarize(count = n())



# ---- generalWork ----
# salaries %>%
#   ggplot(aes(department, median(earnings2015))) +
#   geom_bar(stat = identity)


median <- salaries %>%
  group_by(department) %>% 
  summarize(positionCount = length(jobTitle),
            mediansalaries = round(median(earnings2015), 2)) %>% 
  arrange(desc(mediansalaries))

median <- salaries %>%
  group_by(department, jobTitle) %>%
  summarize(positionCount = length(jobTitle),
            mediansalaries = round(median(earnings2015), 2)) %>% 
  arrange(department, desc(mediansalaries))

# salaries %>% 
#   group_by(department) %>% 
#   summarize(total = sum(earnings2015)) %>% 
#   ggplot(aes(department, total)) +
#   geom_bar(stat = identity)