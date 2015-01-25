library(data.table)
library(dplyr)

data_path=getwd()
featuresFile<-paste0(data_path,'/features.txt')
features<-fread(featuresFile)


##Read the test data into R
X_Test_File<-paste0(data_path,'/test/X_test.txt')
X_Test = read.table(X_Test_File)

Y_Test_File<-paste0(data_path,'/test/Y_test.txt')
Y_Test<- fread(Y_Test_File)

subject_Test_File<-paste0(data_path,'/test/subject_test.txt')
subject_Test<- fread(subject_Test_File)
  
##Read the training data into R
X_Train_File<-paste0(data_path,'/train/X_train.txt')
X_Train = read.table(X_Train_File)

Y_Train_File<-paste0(data_path,'/train/Y_train.txt')
Y_Train<- fread(Y_Train_File)

subject_Train_File<-paste0(data_path,'/train/subject_train.txt')
subject_Train<- fread(subject_Train_File)

##Create a data table with the test data
UCI_data_Test<-data.table(Subject = subject_Test,Activity=Y_Test)
colIndex=1
for (each_feature in features$V2){
        UCI_data_Test[,each_feature]=X_Test[,colIndex]
        colIndex=colIndex+1
}

##Create a data table with the training data
colIndex=1
UCI_data_Train<-data.table(Subject = subject_Train,Activity=Y_Train)
for (each_feature in features$V2){
  UCI_data_Train[,each_feature]=X_Train[,colIndex]
  colIndex=colIndex+1
}

##Change Subject and Activity to factor variables
UCI_data_Test$Subject.V1<-as.factor(UCI_data_Test$Subject.V1)
UCI_data_Test$Activity.V1<-as.factor(UCI_data_Test$Activity.V1)
UCI_data_Train$Subject.V1<-as.factor(UCI_data_Train$Subject.V1)
UCI_data_Train$Activity.V1<-as.factor(UCI_data_Train$Activity.V1)

##Merge the datasets
UCI_data<-rbind(UCI_data_Test,UCI_data_Train,use.names=TRUE)

#Create a dataset with data that contains information about the mean
UCI_data_Means<-select(UCI_data,contains("mean"))

#Create a dataset with data that contains information about the standard deviation
UCI_data_STD<-select(UCI_data,contains("std"))

#Dataset with mean and standard deviations merged with subject and activity factors
UCI_data_Statistics<-cbind(Subject = UCI_data$Subject.V1,Activity=UCI_data$Activity.V1,UCI_data_Means,UCI_data_STD)

#Rename activities with names vs numbers
levels(UCI_data_Statistics$Activity)[match("1",levels(UCI_data_Statistics$Activity))] <- "walking"
levels(UCI_data_Statistics$Activity)[match("2",levels(UCI_data_Statistics$Activity))] <- "walking_upstairs"
levels(UCI_data_Statistics$Activity)[match("3",levels(UCI_data_Statistics$Activity))] <- "walking_downstairs"
levels(UCI_data_Statistics$Activity)[match("4",levels(UCI_data_Statistics$Activity))] <- "sitting"
levels(UCI_data_Statistics$Activity)[match("5",levels(UCI_data_Statistics$Activity))] <- "standing"
levels(UCI_data_Statistics$Activity)[match("6",levels(UCI_data_Statistics$Activity))] <- "laying"

#Rename the columns so t->total, f->fft 
#std-> standarddeviation, remove (,),- and ,
#ac-> acceleration
names(UCI_data_Statistics)<-tolower(names(UCI_data_Statistics))
names(UCI_data_Statistics)<-sub("t","total",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-sub("f","fft",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-gsub(",","",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-gsub("-","",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-gsub("\\(","",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-gsub("\\)","",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-gsub("stotald","std",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-gsub("std","standarddeviation",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-gsub("gravitotaly","gravity",names(UCI_data_Statistics),)
names(UCI_data_Statistics)<-gsub("acc","acceleration",names(UCI_data_Statistics),)
UCI_data_Statistics<-rename(UCI_data_Statistics, subject = subjectotal, activity = actotalivity)

#Group data by different activities for each subject and return the average
different_activities<-group_by(UCI_data_Statistics,subject,activity)
subjects<-unique(different_activities$subject)
tmp_data<-select(different_activities, -(subject:activity))
average_data<-data.table(summarize(tmp_data,totalbodyaccelerationmeanx=mean(totalbodyaccelerationmeanx)))
subject_data<-average_data$subject
activity_data<-average_data$activity
for (each_subject in subjects){print(each_subject)
  reduced_data<-filter(tmp_data,subject==each_subject)
  for(var_name in names(tmp_data)){
    tmp<-summarize(reduced_data,average=mean(get(var_name)))
    average_data[,var_name]<-tmp$average
  }
}
average_data$subject=subject_data
average_data$activity=activity_data
write.table(average_data,file="average_values_for_mean_and_std_variables.txt",row.name=FALSE)