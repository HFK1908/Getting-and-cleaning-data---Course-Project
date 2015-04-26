<h1> Summary

The objective of the script run_analysis.R is to transform the UCI HAR datasets into a small set of variables containing the means of all observations pertaining to means and standard deviations, aggregated by activity and subject.

The script first clears the environment and loads in the plyr-package, which is used in certain steps.

Then the test and train files are loaded and put together through rbind.

Since we want to include only variables pertaining to means and standard deviations, we select the variable names that include "-mean" and "-std" from the features.txt. Matching this to the dataframe X gives us the column names we need. Through various alterations the column names are then made a bit more readable.

The labels for activities are then loaded into the ActLab dataframe, which is then matched to the Y dataframe to give us descriptive labels of the activities in Y. 

The last dataset to be constructed is the Subject-set. A simple rbind of the test and train sets is all that is required.

Having constructed all necessary sets, we cbind these sets together to create the Full_set dataframe. Through the ddply and colMeans command the Means_set dataframe is created which is then exported to Means_set.txt. You can find the result of the script in this repository as well.

The final data contains 68 variables and 180 observations.

<h2> Description of environment

The objects in the environment, created by the run_analysis.R-script, and their descriptions are as follows :

* __X_test__ : Contains all data from the x_test.txt file. 2947 obs. of 561 vars.
* __Y_test__ : Contains all data from the y_test.txt file. 2947 obs. of 1 var.
* __X_train__ : Contains all data from the x_train.txt file. 7342 obs. of 561 vars.
* __Y_train__ : Contains all data from the y_train.txt file. 7342 obs. of 561 vars.
* __X__ : rbind of X_test and X_train. Columns not pertaining to means and standard deviations are excluded using the vector Mean_std_feat (description below).
* __Y__ : rbind of Y_test and Y_train.
* __Feat__ : Contains all data from the features.txt file. 561 obs. of 2 vars.
* __Mean_std_feat__ : Integer vector containing the rownumbers of features pertaining to means and standard deviations.
* __ActLab__ : Contains all data from the activity_labels.txt file.
* __Subject_test__ : Contains all data from the subject_test.txt file.
* __Subject_train__ : Contains all data from the subject_train.txt file.
* __Subject__ : rbind of Subject_test and Subject_train.
* __Full_set__ : cbind of X, Y and Subject.
* __Means_set__ : Means of all variables in Full_set, aggregated by activity(ActivityName) and subject(SubjectID).
