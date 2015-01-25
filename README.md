### Introduction

This is the project for the Getting and Cleaning data course in the data
science track. This file includes instructions on how to use the run_analysis.R
script and it also describes the data that is generated from the script.

### The run_analysis.R Script

In order for you to be able to run the accompaning script you need to 
set your working directory to the top level directory that contains the 
data that was used for the project. For example, if your data was unzipped
in /Users/AUser/Downloads/UCI_HAR_Dataset then you should run the command
setwd('/Users/AUser/Downloads/UCI_HAR_Dataset'). Also, please be sure to
remove the spaces from the location where the file was unzipped.

### The Output File

Once the script has completed, your working directory will contain a file
called "average_values_for_mean_and_std_variables.txt". This file contains the 
reduced tidy dataset with the average of each of the varialbes (those with mean and std)
extracted from the original dataset. The data will be grouped according to the subject
and then according to the activities that were performed. The resulting values in the 
remaining columns are the average values for each of the originally measured variables 
that were extracted from the original datset (those variabls with mean and std).

###The Variables In The Tidy Dataset
Each of the variables in the tidy dataset is an average of the varaible that is named.
The average is for a particular subject for a particular activity.

The variables in the file are:

subject
activity                                       
totalbodyaccelerationmeanx
totalbodyaccelerationmeany                     
totalbodyaccelerationmeanz
totalgravityaccelerationmeanx                  
totalgravityaccelerationmeany
totalgravityaccelerationmeanz                  
totalbodyaccelerationjerkmeanx
totalbodyaccelerationjerkmeany                 
totalbodyaccelerationjerkmeanz
totalbodygyromeanx                             
totalbodygyromeany
totalbodygyromeanz                             
totalbodygyrojerkmeanx
totalbodygyrojerkmeany                         
totalbodygyrojerkmeanz
totalbodyaccelerationmagmean                   
totalgravityaccelerationmagmean
totalbodyaccelerationjerkmagmean               
totalbodygyromagmean
totalbodygyrojerkmagmean                       
fftbodyaccelerationmeanx
fftbodyaccelerationmeany                       
fftbodyaccelerationmeanz
fftbodyaccelerationmeanfreqx                   
fftbodyaccelerationmeanfreqy
fftbodyaccelerationmeanfreqz                   
fftbodyaccelerationjerkmeanx
fftbodyaccelerationjerkmeany                   
fftbodyaccelerationjerkmeanz
fftbodyaccelerationjerkmeanfreqx               
fftbodyaccelerationjerkmeanfreqy
fftbodyaccelerationjerkmeanfreqz               
fftbodygyromeanx
fftbodygyromeany                               
fftbodygyromeanz
fftbodygyromeanfreqx                           
fftbodygyromeanfreqy
fftbodygyromeanfreqz                           
fftbodyaccelerationmagmean
fftbodyaccelerationmagmeanfreq                 
fftbodybodyaccelerationjerkmagmean
fftbodybodyaccelerationjerkmagmeanfreq         
fftbodybodygyromagmean
fftbodybodygyromagmeanfreq                     
fftbodybodygyrojerkmagmean
fftbodybodygyrojerkmagmeanfreq                 
angletotalbodyaccelerationmeangravity
angletotalbodyaccelerationjerkmeangravitymean  
angletotalbodygyromeangravitymean
angletotalbodygyrojerkmeangravitymean          
anglexgravitymean
angleygravitymean                              
anglezgravitymean
totalbodyaccelerationstandarddeviationx        
totalbodyaccelerationstandarddeviationy
totalbodyaccelerationstandarddeviationz        
totalgravityaccelerationstandarddeviationx
totalgravityaccelerationstandarddeviationy     
totalgravityaccelerationstandarddeviationz
totalbodyaccelerationjerkstandarddeviationx    
totalbodyaccelerationjerkstandarddeviationy
totalbodyaccelerationjerkstandarddeviationz    
totalbodygyrostandarddeviationx
totalbodygyrostandarddeviationy                
totalbodygyrostandarddeviationz
totalbodygyrojerkstandarddeviationx            
totalbodygyrojerkstandarddeviationy
totalbodygyrojerkstandarddeviationz            
totalbodyaccelerationmagstandarddeviation
totalgravityaccelerationmagstandarddeviation   
totalbodyaccelerationjerkmagstandarddeviation
totalbodygyromagstandarddeviation              
totalbodygyrojerkmagstandarddeviation
fftbodyaccelerationstandarddeviationx          
fftbodyaccelerationstandarddeviationy
fftbodyaccelerationstandarddeviationz          
fftbodyaccelerationjerkstandarddeviationx
fftbodyaccelerationjerkstandarddeviationy      
fftbodyaccelerationjerkstandarddeviationz
fftbodygyrostandarddeviationx                  
fftbodygyrostandarddeviationy
fftbodygyrostandarddeviationz                  
fftbodyaccelerationmagstandarddeviation
fftbodybodyaccelerationjerkmagstandarddeviation
fftbodybodygyromagstandarddeviation
fftbodybodygyrojerkmagstandarddeviation  