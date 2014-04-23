#1.read data and merge
##create valid variable/column names
varname<-read.table("features.txt",colClasses="character")
colname<-make.names(varname[,2])
##assign variable names
test<-read.table("X_test.txt",colClasses="numeric")
colnames(test)<-colname
train<-read.table("X_train.txt",colClasses="numeric")
colnames(train)<-colname
##merg with subjectid
testsubject<-read.table("subject_test.txt",col.names="subject",colClasses="character")
ts<-cbind(testsubject,test)
trainsubject<-read.table("subject_train.txt",col.names="subject",colClasses="character")
tr<-cbind(trainsubject,train)
##merge two datasets
merge1<-rbind(ts,tr)
#2.extract mean and std variables
merge2<-cbind(merge1[,c(1,grep("[Mm]ean",names(merge1)))],merge1[,grep("[Ss]td",names(merge1))])
#3.label activity
activityname<-read.table("activity_labels.txt",col.names=c("activity","activityname"),colClasses="character")
activitytsnum<-read.table("y_test.txt",col.names="activity",colClasses="character")
activityts<-merge(activityname,activitytsnum,by="activity")
activitytrnum<-read.table("y_train.txt",col.names="activity",colClasses="character")
activitytr<-merge(activityname,activitytrnum,by="activity")
activity<-rbind(activityts,activitytr)
#4.merge with the big dataset
merge3<-cbind(activity,merge2)
#5.create tidy data
library(reshape2)
tidy1<-melt(merge3,id=c("subject","activity","activityname"))
tidy2<-dcast(tidy1,subject+activity+activityname ~ variable,mean)
#tidy the variable name
names(tidy2)
colname<-gsub("fBody[Bb]ody","fBody",names(tidy2))
colname<-gsub("\\.","",colname)
colnames(tidy2)<-colname




