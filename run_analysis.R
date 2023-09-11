###Merges the training and the test sets to create one data set.

        ##First, we read all the required data in and change column name for merging

        #the data for testing subjects
        subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
        X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
        colnames(subject_test)[1]<-"subject"
        colnames(y_test)[1]<-"activity"
        
        #the data for training subjects
        subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
        X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
        colnames(subject_train)[1]<-"subject"
        colnames(y_train)[1]<-"activity"
        
        ##Secondly, we will bind all the above data into one data set
        test_complete_data<-cbind(subject_test,y_test)
        test_complete_data<-cbind(test_complete_data,X_test)
        train_complete_data<-cbind(subject_train,y_train)
        train_complete_data<-cbind(train_complete_data,X_train)
        TestTrain_data<-rbind(test_complete_data,train_complete_data)
        TestTrain_OrderData<-arrange(TestTrain_data, subject)

        ##Next, we will give column names in order to prepare for the next part of the assignment
        features<-read.table("./UCI HAR Dataset/features.txt")
        colnames(TestTrain_OrderData)[3:563]<-features[,2]

###Extracts only the measurements on the mean and standard deviation for each measurement.
        ##Subset the columns with only the measurements on mean and standard deviation
        #First, we will see where the columns with mean and standard deviation are located
        grep("mean",names(TestTrain_OrderData))
        grep("std",names(TestTrain_OrderData))
        
        #Next, based on the results of the above, we will know 
        #which columns containing the measurement of mean and standard deviation.
        #Therefore, we can copy the output in the console and subset those columns out
        TestTrain_OrderData<-TestTrain_OrderData[,c(1,2,3,4,5,43,44,45,83,84,85,123,124,125,
                                               163,164,165,203,216,229,242,255,268,
                                               269,270,296,297,298,347,348,349,375,
                                               376,377,426,427,428,454,455,456,505,
                                               515,518,528,531,541,544,554,
                                               6,7,8,46,47,48,86,87,88,126,127,
                                               128,166,167,168,204,217,230,243,
                                               256,271,272,273,350,351,352,429,
                                               430,431,506,519,532,545)]
        

###Uses descriptive activity names to name the activities in the data set
        ##based on the activity_labels txt files, we will name the labels for activities as following
        TestTrain_OrderData$activity<-sub(pattern = "1", replacement = "WALKING", 
                                          TestTrain_OrderData$activity)
        TestTrain_OrderData$activity<-sub(pattern = "2", replacement = "WALKING_UPSTAIRS", 
                                          TestTrain_OrderData$activity)
        TestTrain_OrderData$activity<-sub(pattern = "3", replacement = "WALKING_DOWNSTAIRS", 
                                          TestTrain_OrderData$activity)
        TestTrain_OrderData$activity<-sub(pattern = "4", replacement = "SITTING", 
                                          TestTrain_OrderData$activity)
        TestTrain_OrderData$activity<-sub(pattern = "5", replacement = "STANDING", 
                                          TestTrain_OrderData$activity)
        TestTrain_OrderData$activity<-sub(pattern = "6", replacement = "LAYING", 
                                          TestTrain_OrderData$activity)
        
###Appropriately labels the data set with descriptive variable names. 
        #First, we will take out all the column names/variable names
        CurrentVarNames<-names(TestTrain_OrderData)
        
        #Secondly, we will make some changes to the name and bind it to our data set
        ChangeVarNames<-sub(pattern = "tBodyAcc",replacement = "TimeBodyAccelerometer",CurrentVarNames)
        ChangeVarNames<-sub(pattern = "tGravityAcc",replacement = "TimeGravityAccelerometer", ChangeVarNames)
        ChangeVarNames<-sub(pattern = "tBodyGyro",replacement = "TimeBodyGyroscope", ChangeVarNames)
        ChangeVarNames<-sub(pattern = "fBodyAcc",replacement = "FreqBodyAccelerometer", ChangeVarNames)
        ChangeVarNames<-sub(pattern = "fBodyGyro",replacement = "FreqBodyGyroscope", ChangeVarNames)
        
        colnames(TestTrain_OrderData)<-ChangeVarNames
        

###From the data set in step 4, creates a second, independent tidy data set with 
###the average of each variable for each activity and each subject.
        #First, we create a new independent data frame by making the copy of the step 4 data
        New_TestTrainData<-data.frame(TestTrain_OrderData)
        
        #Then, we subset the data frame by activity
        Walking<-subset(New_TestTrainData,activity %in% "WALKING")
        WalkingUpstairs<-subset(New_TestTrainData,activity %in% "WALKING_UPSTAIRS")
        WalkingDownstairs<-subset(New_TestTrainData,activity %in% "WALKING_DOWNSTAIRS")
        Sitting<-subset(New_TestTrainData,activity %in% "SITTING")
        Standing<-subset(New_TestTrainData,activity %in% "STANDING")
        Laying<-subset(New_TestTrainData,activity %in% "LAYING")
        
        #Subsequently, we give the group mean by subject for each subset
        #Walking
        for(i in 3:81){
                Walking[,i]<-ave(Walking[,i],Walking[,"subject"],FUN = mean)
        }
        Walking_bysubject<-unique(Walking)
        
        #Walking_upstairs
        for(i in 3:81){
                WalkingUpstairs[,i]<-ave(WalkingUpstairs[,i],WalkingUpstairs[,"subject"],FUN = mean)
        }
        WalkingUpstairs_bysubject<-unique(WalkingUpstairs)
        
        #Walking_downstairs
        for(i in 3:81){
                WalkingDownstairs[,i]<-ave(WalkingDownstairs[,i],WalkingDownstairs[,"subject"],FUN = mean)
        }
        WalkingDownstairs_bysubject<-unique(WalkingDownstairs)
       
        #Sitting
        for(i in 3:81){
                Sitting[,i]<-ave(Sitting[,i],Sitting[,"subject"],FUN = mean)
        }
        Sitting_bysubject<-unique(Sitting)
        
        #Standing
        for(i in 3:81){
                Standing[,i]<-ave(Standing[,i],Standing[,"subject"],FUN = mean)
        }
        Standing_bysubject<-unique(Standing)
        
        #Laying
        for(i in 3:81){
                Laying[,i]<-ave(Laying[,i],Laying[,"subject"],FUN = mean)
        }
        Laying_bysubject<-unique(Laying)
        
        #Lastly, we bind all the subsets together:
        AverageData_byActivity_bySubject<-rbind(Walking_bysubject,WalkingUpstairs_bysubject)
        AverageData_byActivity_bySubject<-rbind(AverageData_byActivity_bySubject,WalkingDownstairs_bysubject)
        AverageData_byActivity_bySubject<-rbind(AverageData_byActivity_bySubject,Sitting_bysubject)
        AverageData_byActivity_bySubject<-rbind(AverageData_byActivity_bySubject,Standing_bysubject)
        AverageData_byActivity_bySubject<-rbind(AverageData_byActivity_bySubject,Laying_bysubject)
        
        View(AverageData_byActivity_bySubject)
        