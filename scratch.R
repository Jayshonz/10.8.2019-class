library(tidyverse)
library(janitor)

tibble(replicate = 1:5) %>% 
       mutate(which_bowl = sample(c("Bowl 1", "Bowl 2"), size = 5, replace = TRUE)) %>%
       mutate(cookie = ifelse(which_bowl == "Bowl 1",
                              sample(c("vanilla", "chocolate"), size = 1, replace = TRUE, prob = c(3/4, 1/4)),
                              sample(c("vanilla", "chocolate"), size = 1, replace = TRUE, prob = c(1/2, 1/2))))
       
       
              

