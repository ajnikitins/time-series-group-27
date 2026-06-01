library(rmarkdown)

# Part 2

# Two stations

env_p2_s2 <- new.env()
rmarkdown::render(
  input = "c:/Users/ajnikitins/Desktop/Projects/time-series-group-27/Final_Project_Part_2_Group_27.rmd",
  output_file = "Final_Project_Part_2_Group_27_2.pdf",
  params = list(n_sttn = 2),
  envir = env_p2_s2
)

env_p2_s3 <- new.env()
rmarkdown::render(
  input = "c:/Users/ajnikitins/Desktop/Projects/time-series-group-27/Final_Project_Part_2_Group_27.rmd",
  output_file = "Final_Project_Part_2_Group_27_3.pdf",
  params = list(n_sttn = 3),
  envir = env_p2_s3
)
