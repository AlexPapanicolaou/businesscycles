library(psymonitor)
library(ggplot2)
library(knitr)
# 1 - Import Data
spx <- read.csv("C:/Users/alexp/Desktop/DissCode/data_csv/gsadf_boot.csv")
date <- as.Date(spx[,1],"%d/%m/%Y")
dy <- spx[,3]
pd <- 1/dy
# Bootstrap Critical Values
y<-pd
obs<-length(y)
r0<-0.01+1.8/sqrt(obs)
swindow0<-floor(r0*obs)
dim<-obs-swindow0+1
IC<-2
adflag<-6
yr<-2
Tb<-12*yr+swindow0-1
nboot<-999
nCore<-2
bsadf<-PSY(y,swindow0,IC,adflag)
quantilesBsadf<-cvPSYwmboot(y,swindow0=swindow0,IC=IC,adflag=adflag,Tb=Tb,nboot=nboot,nCore=nCore)
# Origination and termination dates calculation:
date<-date[swindow0:obs]
quantile95<-quantilesBsadf%*%matrix(1,nrow=1,ncol=dim)
ind95<-(bsadf>t(quantile95[2,]))*1
OT <-locate(ind95,date)
BCdates<-disp(OT,obs)
print(BCdates)
# Visualisation
plot(date,y[swindow0:obs],xlim=c(min(date),max(date)),ylim=c(0.1,1),
       xlab='',ylab='',type='l',lwd=3)

for(i in 1:length(date)){
  if (ind95[i]==1){abline(v=date[i],col=3)}}
points(date,y[swindow0:obs],type='l')
box(lty=1)

# Create Dummy Variable for Python Dataset
BCdates['bubble']