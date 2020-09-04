# Assignement 4, Q 4) Salary_hike -> Build a prediction model for Salary_hike.
# Simple Linear Regression
salary_data<-read.csv(file.choose())
View(salary_data)

# Visualization
install.packages("lattice")
library(lattice)
colnames(salary_data)
attach(salary_data)
dotplot(Salary, main="Dot Plot of salary",col="dodgerblue4")
dotplot(YearsExperience, main="Dot Plot of Yrs of Exp", col="dodgerblue4")
boxplot(Salary,col="green",horizontal = T)
boxplot(YearsExperience,col="red",horizontal = T)

hist(Salary,probability = T,col ='blue')
hist(YearsExperience,probability = T,col = 'red')

library(moments)
skewness(salary_data)
kurtosis(salary_data)

#scatter plot
plot(Salary,YearsExperience)

qqnorm(Salary)
qqline(Salary)

?qqnorm

qqnorm(YearsExperience)
qqline(YearsExperience)

cor(Salary,YearsExperience)

#Regression equation

salary_model<- lm(Salary~YearsExperience,data = salary_data)
summary(salary_model)

salary_model$coefficients
salary_model$residuals

salary_data_new=data.frame(YearsExperience=6)
salaryhike_new=predict(salary_model,newdata =salary_data_new)
salaryhike_new

###########
salaryhike_pred<-predict(salary_model)
salaryhike_pred
final_salarydata<-data.frame(salary_data,salaryhike_pred,"Error"= salary_data$YearsExperience-salaryhike_pred)
View(final_salarydata)
