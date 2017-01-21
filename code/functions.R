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