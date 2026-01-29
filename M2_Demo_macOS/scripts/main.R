cat("M2 Risk Scorer\n")
cat("Enter 5 or 7 numbers separated by spaces:\n> ")

line <- readLines(con = "stdin", n = 1)
parts <- strsplit(trimws(line), "\\s+")[[1]]

if (!(length(parts) %in% c(5, 7))) {
  stop("Please enter exactly 5 or 7 numbers.")
}

if (length(parts) == 5) parts <- c(parts, NA, NA)

x <- data.frame(
  Age = as.numeric(parts[1]),
  OT = as.numeric(parts[2]),
  Cort = as.numeric(parts[3]),
  T = as.numeric(parts[4]),
  IQ = as.numeric(parts[5]),
  ACTH = as.numeric(parts[6]),
  Reading = as.numeric(parts[7])
)

model <- readRDS("models/M2_fit_final.rds")

library(xgboost)
d <- xgb.DMatrix(as.matrix(x))
pred <- predict(model, d)

cat("\nPredicted probability:", pred, "\n")
