# Load the marginaleffects library for computing marginal effects and contrasts
library(marginaleffects)

# Fit a linear model predicting miles per gallon (mpg) based on the number of cylinders (cyl) treated as a factor
mod = lm(mpg ~ factor(cyl), mtcars)

# Compute average comparisons for the model, using the reference category for hypothesis testing
avg_comparisons(mod, hypothesis = ~reference)
