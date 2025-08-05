# Documentation:
# https://vincentarelbundock.github.io/Rdatasets/doc/Lahman/Batting.html
# https://vincentarelbundock.github.io/Rdatasets/doc/Lahman/Salaries.html

library(marginaleffects)
library(ggplot2)
theme_set(theme_minimal())
options(ggplot2.discrete.colour = palette("okabeito")[2:8])

batting = get_dataset("Batting", package = "Lahman")
salaries = get_dataset("Salaries", package = "Lahman")
common = c("playerID", "yearID", "teamID", "lgID")
dat = merge(batting, salaries, by = common)

mod = glm(
    HR ~ poly(yearID, 2) * poly(salary, 2) * AB * lgID,
    family = poisson,
    data = dat)

# Average "effect" of 1$ increase in salary on predicted home runs
avg_comparisons(mod, variables = "salary")

# Average "effect" of 1,000,000$ increase in salary on predicted home runs
avg_comparisons(mod, variables = list("salary" = 1000000))

# Average "effect" of an increase in salary for players in each league.
avg_comparisons(mod,
    variables = list("salary" = 1000000),
    by = "lgID")

# Is the "effect" of salary on home runs equal in the two leagues?
avg_comparisons(mod,
    variables = list("salary" = 1000000),
    by = "lgID",
    hypothesis = ~pairwise)

# No! we cannot reject the null hypothesis that the effect of salary
# on home runs is equal in the two leagues.
