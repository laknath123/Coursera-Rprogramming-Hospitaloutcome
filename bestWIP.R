library(data.table)
library(stringr)
library(dplyr)


best<-function(state=as.character(),condition=as.character()){
  setwd("C:/Users/lakna/OneDrive/Desktop/Coursera/week 4")
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
  datain<<-fread("outcome-of-care-measures.csv",select =c("Hospital Name","State",paste(a,str_to_title(condition))))
  #need to convert the 3rd column to 
  bestHospital<-datain%>%filter(State==state)%>%
    arrange(`State`,paste(a,str_to_title(condition),`Hospital Name`))
  (bestHospital$`Hospital Name`)[1]
}    


best("TX","heart failure")

