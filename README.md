### Peer Assessment for Getting and Cleaning Data Coursera

The R script file run_analysis.R contains a function cleanData() that returns 
a data frame with each row representing a measurement vector from smart phone data 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

the final three columns of the data frame store a number representing a particular 
subject (heading="Subjects") a factor column indicating the activity represented by 
the measurement vector (heading="Activities") and a column giving the average of the 
measurement vector (heading="Means").

The cleanData() function assumes the data is located in the train and test folders
in the current working directory and in files named subject_train.txt, X_train.txt, 
y_train.txt, subject_test.txt, X_test.txt, y_test.txt

The data from these files is read into R the training data is combined column wise, 
The test data is combined column wise and the Subjects(from subject_test and subject_train files) 
and Activities(from ytest and ytrain files) are given the headings (Subjects and Activities)

The data is then combined row wise.

The means of each row vector are extracted into a number vector named Means.
The Standard deviations of each row vector are extracted into a number vector named SDs.

The Activities column is then converted into a factor with the following labels 
1 = WALKING
2 = WALKING_UPSTAIRS 
3 = WALKING_DOWNSTAIRS 
4 = SITTING 
5 = STANDING
6 = LAYING

The averages are then added to the data frame and returned.


