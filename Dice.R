
library(purrr)
library(tidyverse)


throw_dice <- function(){
  roll = sample(x=1:6, size=1)
  dice_list <- c("One", "Two", "Three", "Four", "Five", "Six")
  dice_list[roll]
}

throw_dice()

dice <- function(){
  sample(x=1:6, 1)
}

dice()


roll_dice <- function(n){
  
  results <- vector(mode= "integer", length = n)
  
  for (i in 1:n){
    results[i] = dice() + dice() 
  }
  return(results)
}

x <- tibble(rolls = roll_dice(1000)) 
ggplot(results, aes(x=rolls)) + geom_histogram()



map_dice <- function(n=1){
  
  results <- vector(mode= "integer", length = n)
  
  #Map: (.x = lists, .f = function)
  
  # Need a tidla in front of the function you want to run. 
  map_int(1:n, ~ dice()+dice())

}

x <- tibble(rolls = map_dice(100000)) 
ggplot(x, aes(x=rolls)) + geom_histogram()


p_711 <-  x %>% count(rolls) %>% mutate(p_roll = (n/100000)*100) %>% filter(rolls == "7" | rolls =="11") %>% mutate(total_p=sum(p_roll)) %>% select(total_p) %>% head(1)

# replications 1:100, throws with 3 rolls

tibble_rolls <- function(df) {
  lm(roll_dice ~ roll_dice, throws = df)
}

x <- tibble(replication = 1:100,
              throws = map(1:100, ~roll_dice(3)) %>% 
              mutate(all_win = ifelse(7 %in% unlist(throws), TRUE, FALSE)))

# How common to roll 7 or ll

# Rolling 7 or 11 all three times. 