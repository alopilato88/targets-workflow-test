create_data <- function(n, b) {
  
  x <- rnorm(n)
  y <- rnorm(n, x * b)
  
  df <- tibble::tibble(
    x = x, 
    y = y
  ) %>%
    mutate(
      s_x = scale(x),
      s_y = scale(y)
    )
  
  write.csv(df, "data/simulated-data.csv", row.names = FALSE)
  
}

make_path <- function() {
  
  return("data/simulated-data.csv")
  
}

fit_lm <- function(data) {
  
  mod <- lm(y ~ x, data)
  
  return(mod)
}