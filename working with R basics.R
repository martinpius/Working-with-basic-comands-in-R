getwd()
#We apply iris data set to learn various functions in base R
Mydata<-iris
names(Mydata) #Gives the variable names in your data set
attach(Mydata)#Append variable names in our current working environment
summary(Mydata)#Give the summary statistics for our variables in the dataset
Setosa1<-Mydata[Species=="setosa",]#Subset all setosa species from our data
Vesicolor1<-Mydata[Species=="versicolor",]# Gives the set of all versicolor species
Virginica1<-Mydata[Species=="virginica",]#Give all observations which are virginica
VirgSep<-Mydata[Species=="virginica"&Sepal.Length<6,]#Give all virginica species whose sepal length is less than 6
plot(Mydata)#Give the scatter plot for the data
VersiTal<-Species=="versicolor"&Petal.Length>4#Creating a logical variable
VersiTal1<-as.numeric(VersiTal)#Change it to numeric
MydataExt<-cbind(Mydata,VersiTal1)#Extending the data by adding new feature
View(MydataExt)
apply(Mydata[,1:4],2,mean)#Return the mean value for each selected variable
apply(Mydata[,1:4],1,mean)#Return the mean of every raw/observation
lapply(Mydata[,1:4],summary)#Return the simple version summary statistics for each variable
apply(Mydata[,1:4],2,quantile,probs=c(0.25,0.5,0.75))#Compute the quantiles
apply(Mydata[,1:4],MARGIN=2,FUN=plot,type="l",xlab="Obs",ylab="freq",main="Line plot")#Plot for the selected features
points(apply(Mydata[,1:4],MARGIN = 1,FUN=sum),pch=16,col="red")#Adding mean raws as points
temp1<-by(Sepal.Width,list(Species),FUN = mean)#Does same job as tapply
temp1[1:3]
table(Mydata$Species)#Produce frequency table for a factor variable
tapply(Sepal.Length,INDEX = Species,FUN=mean)#Compute mean for all groups at a time
Model<-lm(Sepal.Length~Species,data = Mydata)#fit the generalized linear model 
anova(Model)#One-way anova model for the data
install.packages("epiR")#Install any packages in R
require(epiR)#Make the package available for use without loading it
#remove.packages("package name") to remove any package from R
#help(package="Name") Help you with details about the package