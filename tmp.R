library(marginaleffects)
mod = lm(Sepal.Length ~ Species, iris)
avg_comparisons(mod, hypothesis = ~reference)
