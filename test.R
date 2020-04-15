library(httr)
library(magrittr)
library(jsonlite)

POST('http://localhost:1026/fit.prob',
	encode = 'json',
	body = list(y = c(1:50))
	) %>% 
	content %>%
	unlist %>%
	print
