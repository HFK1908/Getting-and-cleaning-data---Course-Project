## Clear environment and load in plyr-package.
 
rm(list = ls())

library(plyr)

## 1. Create one dataset from test and train sets.

X_test <- read.table("test\\x_test.txt")
Y_test <- read.table("test\\y_test.txt")

X_train <- read.table("train\\x_train.txt")
Y_train <- read.table("train\\y_train.txt")

X <- rbind(X_test, X_train)
Y <- rbind(Y_test, Y_train)

## 2. Extract the mean and standard deviation features from the feature set. 
##    Add it to the X-set.Correct column names to make them a bit more readable.

Feat <- read.table("features.txt")
Mean_std_feat <- grep("-mean\\(\\)|-std\\(\\)", Feat[, 2])
X <- X[,Mean_std_feat]
names(X) <- Feat[Mean_std_feat, 2]
names(X) <- gsub("\\(|\\)|\\-", "", names(X))
names(X) <- gsub("\\mean", "\\Mean", names(X))
names(X) <- gsub("std", "Std", names(X))

## 3. Import the labels and merge them to Y. Give the columns descriptive names.

ActLab <- read.table("activity_labels.txt")
Y[,1] <- ActLab[Y[,1],2]
colnames(Y) <- "ActivityName"

## 4. Import and merge subject sets. Give the column a descriptive name. 
##    All other descriptive naming for X and Y sets happened in steps 2 and 3.

Subject_test <- read.table("test\\subject_test.txt")
Subject_train <- read.table("train\\subject_train.txt")
Subject <- rbind(Subject_test, Subject_train)
colnames(Subject) <- c("SubjectID")

## 5. Put sets together. Then calculate means per subject and activity for every 
##    column and put these means in a new dataset.Then write to .txt.

Full_set <- cbind(X,Y,Subject)

Means_set <- ddply(Full_set, .(ActivityName, SubjectID), function(Means) colMeans(Full_set[ 1:66]))

write.table(Means_set,"Means_set.txt")
