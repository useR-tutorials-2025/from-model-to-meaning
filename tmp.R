library(marginaleffects)
mod = lm(mpg ~ factor(cyl), mtcars)
avg_comparisons(mod, hypothesis = ~reference)
