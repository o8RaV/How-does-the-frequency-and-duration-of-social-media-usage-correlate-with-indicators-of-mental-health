# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Import the dataset from a CSV file
df <- read.csv("dataverse_files/social_media_mental_health.csv")

set.seed(123)  # Set seed for reproducibility
data <- df %>% sample_n(100)

# Summary statistics
summary(data)

# Graph 1: Bar chart depicting the distribution of social media usage frequency among adolescents
graph1 <- ggplot(data, aes(x = Social_Media_Frequency)) +
  geom_bar(fill = "skyblue", color = "black") +
  labs(title = "Distribution of Social Media Usage Frequency",
       x = "Social Media Usage Frequency",
       y = "Count") +
  theme_minimal()

# Graph 2: Scatter plot showing the correlation between social media usage duration and anxiety levels among adolescents
graph2 <- ggplot(data, aes(x = Social_Media_Duration, y = Anxiety_Score)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Correlation between Social Media Usage Duration and Anxiety Levels",
       x = "Social Media Usage Duration",
       y = "Anxiety Score") +
  theme_minimal()

# Graph 3: Box plot illustrating the variation in social media usage duration across different age groups
graph3 <- ggplot(data, aes(x = factor(Age), y = Social_Media_Duration)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = "Variation in Social Media Usage Duration Across Age Groups",
       x = "Age Group",
       y = "Social Media Usage Duration") +
  theme_minimal()

# Display the graphs
# print(graph1)
print(graph2)
# print(graph3)
