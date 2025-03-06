# fit a model using mtcars instead of iris AI!
library(marginaleffects)
mod = lm(Sepal.Length ~ Species, iris)
avg_comparisons(mod, hypothesis = ~reference)
