install.packages("tidyverse")
library(tidyverse)
1 / 2 ^ 3
1.2
"tag"

a <- 2
a -> b

"hallo welt" |> 
  str_split(" ") -> b
b

"hallo welt" %>%
  stringr::str_split(" ") -> b
b

?str_split

d <- c(1, 2, 3, 4)
d[1]
d[1:3]
d[seq(1, 3, 2)]
d[c(2,3)]

func <- function(a) {
  a * 2
}
func(2)

d * 4


seq(from=2, to=10)
