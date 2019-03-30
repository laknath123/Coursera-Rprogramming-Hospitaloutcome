library(data.table)
library(dplyr)

#Reading only the required part of the datasert

 wd<-"C:/Users/lakna/OneDrive/Desktop/Coursera/week 4"
 setwd(wd)
# list.files(wd)
# 
# 
 datain<-fread("outcome-of-care-measures.csv")#,select =c("Provider Number","Hospital Name","State"))

#code for throwing error message
# state<-c("TX","MO","PA")
# 
# my.state<-"NV"
# 
# 
# my.state %in% state
# 
# if (my.state %in% state==FALSE){
#   stop("ivalid state")
# }


# #code for finding best hospital
# bestHospital<-datain%>%
#   select(`Hospital Name`,State,`Hospital 30-Day Death (Mortality) Rates from Heart Attack`)%>%
#       arrange(`State`,`Hospital 30-Day Death (Mortality) Rates from Heart Attack`)%>%filter(State=="TX")
# 
# (bestHospital$`Hospital Name`)[1]



best.R<-function(state=as.character(),condition=as.character()){
   wd<-"C:/Users/lakna/OneDrive/Desktop/Coursera/week 4"
   setwd(wd)
  if (condition=="heart attack"){
    datain<<-fread("outcome-of-care-measures.csv",select =c("Hospital Name","State","Hospital 30-Day Death (Mortality) Rates from Heart Attack"))
    datain$`Hospital 30-Day Death (Mortality) Rates from Heart Attack`<-as.numeric(datain$`Hospital 30-Day Death (Mortality) Rates from Heart Attack`)
    bestHospital<-datain%>%
           arrange(`State`,`Hospital 30-Day Death (Mortality) Rates from Heart Attack`)%>%filter(State==state)
     (bestHospital$`Hospital Name`)[1]
  } else if (condition=="heart failure"){
    datain<-fread("outcome-of-care-measures.csv",select=c("Hospital Name","State","Hospital 30-Day Death (Mortality) Rates from Heart Failure"))  
    datain$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`<-as.numeric(datain$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`)
    bestHospital<<-datain%>%arrange(`State`,`Hospital 30-Day Death (Mortality) Rates from Heart Failure`,`Hospital Name`)%>%filter(State==state)
    (bestHospital$`Hospital Name`)[1]
  }
 
}




best.R("TX", "heart attack")

