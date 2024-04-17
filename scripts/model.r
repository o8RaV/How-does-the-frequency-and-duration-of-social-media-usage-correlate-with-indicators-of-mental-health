# Load required library
library(dplyr)

# Define sample size
sample_size <- 3000

# Set seed for reproducibility
set.seed(123)

# Generate random data for age of the teen (between 13 and 18)
age <- sample(13:18, sample_size, replace=TRUE)

# Generate random data for social media usage frequency and duration
# Increase social media usage as age increases
social_media_frequency <- sample(age * 0.5:(age * 1.5 + 1), sample_size, replace=TRUE)
social_media_duration <- sample(pmax(age * 0.5, 1):(pmin(age * 1.5 + 1, 25)), sample_size, replace=TRUE)  # Ensure max duration is 24 hours

# Generate random data for indicators of mental health (anxiety and depression)
# Increase mental health problems as social media use increases
anxiety_scores <- (100 - sample(0:100, sample_size, replace=TRUE)) * social_media_duration / 10
depression_scores <- (100 - sample(0:100, sample_size, replace=TRUE)) * social_media_duration / 10

# Create a data frame to hold the data
data <- data.frame(
  Age = age,
  Social_Media_Frequency = social_media_frequency,
  Social_Media_Duration = social_media_duration,
  Anxiety_Score = anxiety_scores,
  Depression_Score = depression_scores
)

# Export the data frame to a CSV file
write.csv(data, "data/social_media_mental_health.csv", row.names = FALSE)

# Display the first few rows of the dataset
print(head(data))

# Fit a linear regression model to predict anxiety scores
model <- lm(Anxiety_Score ~ Age + Social_Media_Frequency + Social_Media_Duration, data=data)

# Print the summary of the model
print(summary(model))
saveRDS(model, "data/linear_regression_model.rds")