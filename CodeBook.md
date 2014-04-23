Procedure
==========================
1. Merges the training and the test sets to create one data set.
   * datasets are downloaded into the local working directory and unzipped
   * datasets used to merge: feature.txt,activity_lables.txt, subject_text,X_test.txt,y_test.txt,subject_train.txt,x_train.txt,y_train.txt
   * each line in these datasets comes from one subject,except feature.txt is used for variable names.
   * a total of 30 subjects, 9 in test set, 21 in training set.
   * get merged dataset is "merge1"
2. Extracts only the measurements on the mean and standard deviation for each measurement
   * select columns with variable names contain "mean" and "std"
   * get "merge2"
3. Uses descriptive activity names to name the activities in the data set
   * dataset "activity", contains activity class and activity names
4. Appropriately labels the data set with descriptive activity names
   * get "merge3"
5. Creates a second, independent tidy data set with the average of each variable for each 6 activity and each subject.
   * get final tidy data: "tidy2", with tidy variable names and each line represents a subject and different variable values in a particular activity

