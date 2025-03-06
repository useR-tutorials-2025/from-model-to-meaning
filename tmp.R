# comment and explain each line of code AI!
library(marginaleffects)
mod = lm(mpg ~ factor(cyl), mtcars)
avg_comparisons(mod, hypothesis = ~reference)
