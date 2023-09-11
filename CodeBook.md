# **Code book for Assignment Data**

## - Details for Tidy Data 1

1.  Variable Names Operation and Information

    -   Signal content

        | Original Name    | Operation                                | Description                                                  |
        |------------------------|------------------------|------------------------|
        | tBodyAcc         | Changed to 'TimeBodyAccelerometer'       | Body Acceleration with time domain                           |
        | tGravityAcc      | Changed to 'TimeGravityAccelerometer'    | Gravity Acceleration with time domain                        |
        | tBodyAccJerk     | Changed to 'TimeBodyAccelerationJerk'    | Body Acceleration Jerking sensor signals with time domain    |
        | tBodyGyro        | Changed to 'TimeBodyGyroscope'           | Body gyroscope signals with time domain                      |
        | tBodyGyroJerk    | Changed to 'TimeBodyGyroscopeJerk'       | Body gyroscope jerking signals with time domain              |
        | tBodyAccMag      | Changed to 'TimeBodyAccelerometerMag'    | Body acceleration mag signals with time domain               |
        | tGravityAccMag   | Changed to 'TimeGravityAccelerometerMag' | Gravity acceleration mag signal with time domain             |
        | tBodyAccJerkMag  | Changed to 'TimeBodyAccelerometerJerkMag | Body acceleration jerk and mag signals with time domain      |
        | tBodyGyroMag     | Changed to 'TimeBodyGyroscopeMag'        | Body gyroscope mag signal with time domain                   |
        | tBodyGyroJerkMag | Changed to 'TimeBodyGyroscopeJerkMag'    | Body gyroscope signals in jerk and mag with time domain      |
        | fBodyAcc         | Changed to 'FreqBodyAccelerometer'       | Body acceleration signals with frequency domain              |
        | fBodyAccJerk     | Changed to 'FreqBodyAccelerometerJerk'   | Body acceleration with jerk signals with frequency domain    |
        | fBodyGyro        | Changed to 'FreqBodyGyroscope'           | Body gyroscope signal with frequency domain                  |
        | fBodyAccMag      | Changed to 'FreqBodyAccelerometerMag'    | Body acceleration mag signals with frequency domain          |
        | fBodyAccJerkMag  | Changed to 'fBodyBodyAccJerkMag'         | Body acceleration jerk and mag signals with frequency domain |
        | fBodyGyroMag     | Changed to 'fBodyBodyGyroMag'            | Body gyroscope mag signals with frequency domain             |
        | fBodyGyroJerkMag | Changed to 'fBodyBodyGyroJerkMag'        | Body gyroscope jerking and mag signals with frequency domain |

    -   Statistical Measuremeants

        | Measurement Names | Description                                                                  |
        |-----------------|-------------------------------------------------------|
        | mean()            | Mean value                                                                   |
        | std()             | Standard deviation                                                           |
        | mad()             | Median absolute deviation                                                    |
        | max()             | Largest value in array                                                       |
        | min()             | Smallest value in array                                                      |
        | sma()             | Signal magnitude area                                                        |
        | energy()          | Energy measure. Sum of the squares divided by the number of values.          |
        | iqr()             | Interquartile range                                                          |
        | entropy()         | Signal entropy                                                               |
        | arCoeff()         | Autorregresion coefficients with Burg order equal to 4                       |
        | correlation()     | correlation coefficient between two signals                                  |
        | maxInds()         | index of the frequency component with largest magnitude                      |
        | meanFreq()        | Weighted average of the frequency components to obtain a mean frequency      |
        | skewness()        | skewness of the frequency domain signal                                      |
        | kurtosis()        | kurtosis of the frequency domain signal                                      |
        | bandsEnergy()     | Energy of a frequency interval within the 64 bins of the FFT of each window. |
        | angle()           | Angle between to vectors.                                                    |

    -   3-axis

        | Axis Name | Description                     |
        |-----------|---------------------------------|
        | X         | signals captured in X direction |
        | Y         | signals captured in Y direction |
        | Z         | signals captured in Z direction |

    -   Other Variables

        | Variable Name | Description                          | Values                                                                               |
        |---------------|--------------------------------------|--------------------------------------------------------------------------------------|
        | subject       | subject identifier number            | numeric vector: 1-30                                                                 |
        | activity      | the activity that subjects are doing | 1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING |

2.  Data Merging Operation

-   Merging the training and the test sets to create one data set: First, we read all the required data in and change column name for merging; Secondly, we bind all the above data into one data set; Next, we give some initial column names provided by features.txt files. More operations on changing variable names are done in the upcoming steps.

-   Extracts only the measurements on the mean and standard deviation for each measurement: first, we used grep() function to find out the positions of where the mean and standard deviation columns are; then we subset those columns out together with the subject column and activity columns.

-   Using descriptive activity names to name the activities in the data set: based on the activity_labels txt files, we name the labels for activities as following: 1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING.

-   Appropriately labels the data set with descriptive variable names: the operations and new variable labels can be seen in the first section of this markdown file.

-   For the detailed operation in R, please consult 'run_analysis.R'.

## - Details for Tidy Data 2

Based on the tidy data set above, we will perform the below operations to set up a second tidy data with mean for each measurements:

-   First, we create a new independent data frame by making the copy of the step 4 data;

-   Then, we subset the data frame by activity and we have 6 subset, namely: Walking, WalkingUpstairs, WalkingDownstairs, Sitting, Standing, and Laying;

-   Subsequently, we give the group mean by subject for each subset;

-   Lastly, we bind these 6 separate together into one complete dataset
