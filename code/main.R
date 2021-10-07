# This code was prepared by Nam Le and Hoai Pham
#load in necessary package
library(readr)
library(rattle)
library(tidyverse)
library(dplyr)
library(rattle)
library(ggplot2)

setwd("/cloud/project/code") #set the reading directory for the file
df <-read.csv("../data/ptdata_final.csv")

df<-data.frame(df)

summary(df)


#counting
df%>%select(job_status)%>%
  count(job_status)

# or simply as

df%>% count(job_status)

#ploting - bar
ggplot(df%>%count(job_status),aes(x=job_status,y=n))+
geom_bar(stat = "identity",fill="#69b3a2",color="#e9ecef", alpha=0.9)+
geom_text(aes(label=n), position=position_dodge(width=0.9), vjust=-0.25, colour="red")+
  labs(title="Job Status",x ="Group", y = "Number")

#wanna print with real name

re_name<-recode_factor(df1$job_status, `1` = "x", `2` = "y", `3` = "z",`4` = "w",
                       .default = "D", .missing = "M")


ggplot(df%>%count(job_status)%>%mutate(re_name),aes(x=re_name,y=n))+
  geom_bar(stat = "identity",fill="#69b3a2",color="#e9ecef", alpha=0.9)+
  geom_text(aes(label=n), position=position_dodge(width=0.9), vjust=-0.25, colour="red")+
  labs(title="Job Status",x ="Group", y = "Number")


#perform correlation analysis


df%>%select(job_status, edu_level, income)

plot(df$edu_level~df$income)

cor(df$edu_level, df$income, method = c("pearson"))

cor(df$edu_level, df$income, method = c("kendall"))

cor(df$edu_level, df$income, method = c("spearman"))





