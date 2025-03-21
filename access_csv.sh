#!/bin/bash

# Define the weather data file
WEATHER_FILE="Weather_Data_Scraping_and_Analysis/weather.csv"

# Check if the weather file exists
if [ ! -f "$WEATHER_FILE" ]; then
    echo "Weather file not found: $WEATHER_FILE"
    exit 1
fi

# Extract the first city's name (excluding the header)
CITY=$(awk -F',' 'NR==2 {print $2}' "$WEATHER_FILE")

# Construct the corresponding CSV file path
DATA_FILE="data/${CITY}.csv"

# Check if the city's data file exists
if [ -f "$DATA_FILE" ]; then
    # Print the first 10 lines of the file
    echo "Displaying first 10 lines of $DATA_FILE:"
    head -n 10 "$DATA_FILE"
else
    echo "Data file not found: $DATA_FILE"
fi
