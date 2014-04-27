cleanData<-function(){

  print("reading training files...")
  subTrain<-read.table('train/subject_train.txt',check.names=F)
  xtrain<-read.table('train/X_train.txt',check.names=F)
  ytrain<-read.table('train/y_train.txt',check.names=F)
  names(ytrain)<-c('Activities')
  names(subTrain)<-c('Subjects')
  print("Training files read now combing training data...")
  trainData<-data.frame(xtrain,ytrain,subTrain)
  print("Training data combined!")

  print("reading testing files...")
  subTest<-read.table('test/subject_test.txt',check.names=F)
  xtest<-read.table('test/X_test.txt',check.names=F)
  ytest<-read.table('test/y_test.txt',check.names=F)
  names(ytest)<-c('Activities')
  names(subTest)<-c('Subjects')
  
  print("files read now combing Test data...")
  testData<-data.frame(xtest,ytest,subTest)
  print('Test data combined!')
  
  print("Combining training and Test Data...")
  data<-rbind(trainData,testData)
  print("Data is combined and held in the dataframe named data")
  
  print("Extracting Means and SDs of each measurement Vector")
  Means<-rowMeans(data[,1:561])
  SDs<-transform(data[,1:561],SD=apply(data[,1:561],1,sd))$SD
  print("The means are stored in Means and Standard Deviations in SDs")
  
  print("Factorising the Activities column")
  temp<-data$Activities
  Act<-factor(temp,labels=c('WALKING','WALKING_UPSTAIRS',
                                   'WALKING_DOWNSTAIRS','SITTING',
                                   'STANDING','LAYING'))
  data<-cbind(data,Act)
  data$Activities<-NULL
  colnames(data)[colnames(data)=='Act']<-'Activities'
  
  print("Creating newData with vectors, average of each vector, 
        means, subjects and Activities..")
  cleanData<-data.frame(data, Means=Means)
  print("New data created , function retutning..")
  cleanData
}

