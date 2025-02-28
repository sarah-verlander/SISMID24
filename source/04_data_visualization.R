load(here::here("data", "clean.Rdata"))

library(tidyverse)
library(forcats)


# add another comment - 2nd round of changes
plot1 = covid %>%
  mutate(county = factor(county),
         county = fct_reorder(county, concentration)) %>%
  ggplot(aes(county, log(concentration), group = county, fill = county)) +
  geom_boxplot() +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 30, hjust = 1)) #changed angle to 30 degrees
#another comment to test branch creation


## gonna do something here with the dates to make this prettier.
## weird that the scales are so different across sites
plot2 = covid %>%
  ggplot(aes(date, concentration, group = interaction(county, wwtp_id))) +
  geom_line() +
  facet_wrap(~county, scales = "free")



