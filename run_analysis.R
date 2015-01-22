# 1-Load packages
library(dplyr)

# 2-Read text data
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
sub_test <- read.table("subject_test.txt")
sub_train <- read.table("subject_train.txt")
features <- read.table("features.txt")
act_label <- read.table("activity_labels.txt")

# 3-Merge the training and test data sets
##Combine subject & activity labels
mtest <- cbind(sub_test, ytest, xtest)
mtrain <- cbind(sub_train, ytrain, xtrain)
##Combine test & training data
merged <- rbind(mtest, mtrain)

# 4-Pick up the "features"
feat <- as.vector.factor(features[, 2])
##Remove ()- characters from feature
feat <- gsub('\\(', '', feat)
feat <- gsub('\\)', '', feat)
feat <- gsub('-', '', feat)
##Make each feature name unique
feat <- make.names(feat, unique=TRUE)

# 5-Rename column names
colnames(merged) <- c("subject", "activity", feat)
selected <- select(merged, subject, activity, contains("mean"), contains("std"))

# 6-Use descriptive activity names
selected$activity[selected$activity == 1] = "WALKING"
selected$activity[selected$activity == 2] = "WALKING_UPSTAIRS"
selected$activity[selected$activity == 3] = "WALKING_DOWNSTAIRS"
selected$activity[selected$activity == 4] = "SITTING"
selected$activity[selected$activity == 5] = "STANDING"
selected$activity[selected$activity == 6] = "LAYING"

# 7-Tidy data
tidydat <- group_by(selected, subject, activity) %>%
        summarise_each(funs(mean))
        
# 8-Save tidy data to txt file
write.table(tidydat, file = "tidy.txt", row.names = FALSE)
