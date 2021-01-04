rm(list=ls())
library(plyr)
library(experiment)
library(AER)

data=read.csv('india.csv')

### remove the observations with missing hospital expenditure, treatment or treatment receipt
data=rename(data,c('village_id'='id','treat'='Z','mech'='A','enrolled'='D'))
data=data[! (  is.na(data$Z) |is.na(data$D)),]

#### remove villages with only one unit
data=data[data$id !=2792000 & data$id !=2813900,]

### impute the assignment mechanism for the observations

cluster.id=unique(data$id)	
  n.cluster=length(cluster.id)	
  A=rep(0,n.cluster)
  impute.cluster=NULL
  for (i in 1:n.cluster){

  	if (length(unique(data$A[data$id==cluster.id[i]]))!=1){
  		 impute.cluster=c(impute.cluster,cluster.id[i])
  		# stop( paste0('The assignment mechanism in cluster ',i,' should be the same.'))
  	}
  }
  for (cluster in impute.cluster){
  	data$A[data$id==cluster] = mean (data$A[data$id==cluster],na.rm=TRUE)
  }
  


 


####
#####
######### summary statistics
## proportion of High  
 table(data$A)
 
 ## Proportion of treatment receipt under A=1 and A=0

 mean(data$D[data$A==1])
mean(data$D[data$A==0])

mean(data$D[data$Z==1])
mean(data$D[data$Z==0])




##### range and median of hospital expenditure
range(data$EXPhosp_1[!is.na(data$EXPhosp_1)])
median(data$EXPhosp_1[!is.na(data$EXPhosp_1)])

###

#######################################
######################################
####  Results for hospital expenditure

data.hosp=rename(data,c('EXPhosp_1'='Y'))

data.hosp=data.hosp[!is.na(data.hosp$Y),]
Z=vector("list", n.cluster) 	
  
  for (i in 1:n.cluster){
  	Z[[i]]=as.numeric(data.hosp$Z[data.hosp$id==cluster.id[i]])
  }
  n=sapply(Z,length)
  id.remove= cluster.id[n-sapply(Z,sum)<=1 | sapply(Z,sum)<=1]
data.hosp=data.hosp[!(data.hosp$id %in% id.remove),]


##### Calculate the CADE, CASE as well as the ITT effects
data.hosp$id=as.factor(data.hosp$id)


#######   results for individual weighted estimands (change individual=1 to individual=0 for village-weighted estimands)
re.hosp.all=CADErand(data.hosp,individual=1)


round(as.numeric(re.hosp.all[1:4]))
round(as.numeric(re.hosp.all[1:4])-  1.96*sqrt(  as.numeric(re.hosp.all[5:8])),3)
round(as.numeric(re.hosp.all[1:4])+  1.96*sqrt(  as.numeric(re.hosp.all[5:8])),3)

### ITT direct
round(as.numeric(re.hosp.all[9:12]),3)
round(as.numeric(re.hosp.all[9:12])-  1.96*sqrt(  as.numeric(re.hosp.all[13:16])),3)
round(as.numeric(re.hosp.all[9:12])+  1.96*sqrt(  as.numeric(re.hosp.all[13:16])),3)


#### ITT spillover effect
round(as.numeric(re.hosp.all[17:20]),3)
round(as.numeric(re.hosp.all[17:20])-  1.96*sqrt(  as.numeric(re.hosp.all[21:24])),3)
round(as.numeric(re.hosp.all[17:20])+  1.96*sqrt(  as.numeric(re.hosp.all[21:24])),3)


####### model-based analysis
 ## ITT
 data.ITT=data.hosp
 data.ITT$A[data.ITT$A==1]=0.8
 data.ITT$A[data.ITT$A==0]=0.2
lmITT=lm(Y~Z+A+Z:A, data=data.ITT)
var.lmITT=vcovHC(lmITT, type = "HC2", cluster = "id", adjust = T)
matrix1=array(0,dim=c(4,4))
matrix1[1,]=c(0,1,0,1)
matrix1[2,2]=1
matrix1[3,c(3,4)]=1
matrix1[4,3]=1


effect=as.numeric(matrix1%*%lmITT$coefficients)
var.effect=matrix1%*%var.lmITT%*%t(matrix1)
sd.effect=sqrt(diag(var.effect))

round(effect)
round(effect-1.96*sd.effect)
round(effect+1.96*sd.effect)

## iv estimate

data.iv=data.hosp
data.iv$propD=data.iv$D
### create a new variable for the proportion of D
cluster.id=unique(data.iv$id)	
  n.cluster=length(cluster.id)	
for (i in 1:n.cluster){
  	  data.iv$propD[data.iv$id==cluster.id[i]]= mean(data.iv$D[data.iv$id==cluster.id[i]])
  }
  
lmiv=  ivreg(Y~D+propD+D:propD | Z+A+Z:A,data=data.iv)
var.lmiv=vcovHC(lmiv, type = "HC2", cluster = "id", adjust = T)

effect.iv=as.numeric(matrix1%*%lmiv$coefficients)
var.effect.iv=matrix1%*%var.lmiv%*%t(matrix1)
sd.effect.iv=sqrt(diag(var.effect.iv))

round(effect.iv)
round(effect.iv-1.96*sd.effect.iv)
round(effect.iv+1.96*sd.effect.iv)



