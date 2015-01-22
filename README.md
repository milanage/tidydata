**How does my run_analysis.R script work?**


# 1-Load packages
Load the necessary R package(dplyr).

# 2-Read text data
Use "read.table()" to initialize all the data variables.

# 3-Merge the training and test data sets
Use "cbind()" to combine subject/activity data to the testing data.
Do the same thing to the training data.
Then use "rbind()" to combine all the testing and training data, so that you get the complete dataset.

# 4-Pick up the "features"
Load feature names to a vector.
Remove characters like "(", ")", "-" from the feature names.
Make all feature names unique using "make.names( , unique = TRUE)

# 5-Rename column names
Give the merged data descriptive column names.
Then select columns with "mean"or"std" in the variable names, as well as "subject" and "activity" columns.

# 6-Use descriptive activity names
Convert the number (1-6) in column "activity" to descriptive names as described in "activity_lables.txt"

# 7-Tidy data
Group the data by "subject" and "activity".
Then calculate the average(mean) of each column on the grouped data using "summarise_each()".
        
# 8-Save tidy data to txt file
Save the tidy data to a text file using "write.table()".
