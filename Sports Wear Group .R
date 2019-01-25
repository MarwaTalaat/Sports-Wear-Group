
install.packages("dplyr")

#importing dataSset
DataSource <- read.csv(file.choose(),header = T)

#removing retailweek column since it donesnt has any info
DataSource<- subset(DataSource,select = -c(retailweek))
View(DataSource)

#Structure of dataset
str(DataSource)

#draw plot of cost vs sales regarding country
plot( DataSource)
with(DataSource,text(cost~sales,labels=country,pos=4,cex=.3))
library(ggplot2)
ggplot(data = DataSource, aes(x = cost, y = sales)) + geom_point(aes(color = country))


#subsetting data frame and normalize values

library("dplyr")
norm_DataSource <- select(DataSource, country, sales,category, cost, gender, label)
View(norm_DataSource)
str(norm_DataSource)

#change label into categorical variable
norm_DataSource[6] <- lapply(norm_DataSource[6], as.factor)
View(norm_DataSource)
#View(is.na(norm_DataSource$gender))

#two way table of factor variable to make sure that we dont have zero values
#using cross tabulation
xtabs(~label+ country , data= norm_DataSource)
xtabs(~label+ gender , data= norm_DataSource)

#data partitioning train 80% and test 20%
set.seed(1234)
DataPart <- sample (2,nrow(norm_DataSource),replace=T, prob = c(0.8,0.2))
trainSet <- norm_DataSource[DataPart==1,]
testSet <- norm_DataSource[DataPart==2,]

#Logisitic regression model

RegModel_1 <- glm(label~ country+category+sales+cost+gender, data=trainSet, family = 'binomial')
summary(RegModel_1)

#gender & cost removed sonce they are not significant
RegModel_2 <- glm(label~ country+category+sales, data=trainSet, family = 'binomial')
summary(RegModel_2)

#compare two models, so RegModel_2 is better than RegModel_1
anova(RegModel_1,RegModel_2,test = "Chisq")

#prediction
predict1<- predict(RegModel_2,trainSet, type='response')
head(predict1)
head(trainSet)

#model evaluation
#confusion matrix for traing set
TrainPredict <- ifelse(predict1>0.5,1,0)
table1 <- table(Predicted =TrainPredict, Actual =trainSet$label)
table1
missClassError <- 1- sum(diag(table1))/sum(table1)
missClassError

#confusion matrix for testing set
predict2 <- predict(RegModel, testSet,type = 'response')
testPredict <- ifelse(predict2>0.5,1,0)
table2 <- table(Predicted = testPredict, Actual = testSet$label)
table2
missClassificationError <- 1- sum(diag(table2))/sum(table2)
missClassificationError