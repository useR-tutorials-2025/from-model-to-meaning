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

# Predicted count of home runs for a specific type of player
predictions(mod, newdata = datagrid(
    yearID = 2010,
    salary = 5000000,
    AB = 500,
    lgID = "AL"
))

# TODO: Predicted count of home runs for lowest and highest salaries.
# Hint: `datagrid()` can use functions like `range` instead of specific values.

# Average predicted count of home runs by League
avg_predictions(mod, by = "lgID")

# TODO:: Average predicted count of home runs for each combination of team and year.
# Hint: Use a vector in the `by` argument.

# Predicted count of home runs for an average/modal player, over time
plot_predictions(mod, condition = "yearID")

# TODO: Plot predicted count of home runs over year and lgID
# Hint: Use a character vector in the `condition` argument.
