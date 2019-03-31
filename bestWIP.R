#2 Finding the best hospital in a state
#This a function required to complete Programming Assignment 3 of Coursera R programming Course
#Following is my solution to the problem

library(data.table)
library(stringr)
library(dplyr)


best<-function(state=as.character(),condition=as.character()){
  setwd("C:/Users/lakna/OneDrive/Desktop/Coursera/week 4") #set the path where the csv file resides in your computer 
  stlist<-fread("outcome-of-care-measures.csv",select=c("State"))
  st<-unique(stlist$State)
  a<-'Hospital 30-Day Death (Mortality) Rates from'
  cond<-c("heart attack","heart failure","pneumonia")
  if (condition %in% cond==FALSE){
    stop("invalid outcome")
  }
  else if (state %in% st==FALSE){
    stop("invalid state")
  }
  datain<-fread("outcome-of-care-measures.csv",select =c("Hospital Name","State",paste(a,str_to_title(condition))))
  datain[,3]<-as.numeric(unlist(datain[,3]))
    bestHospital<<-datain%>%filter(State==state)
    bestHospital<-bestHospital[order( bestHospital[,3], bestHospital[,3] ),]
      (bestHospital$`Hospital Name`)[1]
}    


best("TX","heart failure")
