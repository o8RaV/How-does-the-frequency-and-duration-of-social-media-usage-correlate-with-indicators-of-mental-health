import pandas as pd
import numpy as np

# Define sample size
sample_size = 3000

# Generate random data for age of the teen (between 13 and 18)
age = np.random.randint(13, 19, sample_size)

# Generate random data for social media usage frequency and duration
# Increase social media usage as age increases
social_media_frequency = np.random.randint(age * 0.5, age * 1.5 + 1, sample_size)
social_media_duration = np.random.randint(np.maximum(age * 0.5, 1), np.minimum(age * 1.5 + 1, 25), sample_size)  # Ensure max duration is 24 hours

# Generate random data for indicators of mental health (anxiety and depression)
# Increase mental health problems as social media use increases
anxiety_scores = (100 - np.random.randint(0, 101, sample_size)) * social_media_duration / 10
depression_scores = (100 - np.random.randint(0, 101, sample_size)) * social_media_duration / 10

# Create a DataFrame to hold the data
data = pd.DataFrame({
    'Age': age,
    'Social_Media_Frequency': social_media_frequency,
    'Social_Media_Duration': social_media_duration,
    'Anxiety_Score': anxiety_scores,
    'Depression_Score': depression_scores
})

# Export the DataFrame to a CSV file
data.to_csv('dataverse_files/social_media_mental_health.csv', index=False)

# Display the first few rows of the dataset
print(data.head())
