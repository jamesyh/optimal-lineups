library(R2jags)
library(reshape2)


load("data/NBA2009.RData")

rm(list = (ls()[ls() != "final"]))

THEfinal = final

table(final$team)

TEAMS = unique(final$team)

for(theTEAM in TEAMS){
  
  final = THEfinal
  
  final = final[final$team == theTEAM , ]
  
  
  
  
  players = final[ , grepl("Player",names(final))]
  players = players[ , names( apply(players,2,sum) != 0 )[apply(players,2,sum) != 0]  ]
  
  lineup = final[ , grepl("lineup",names(final))]
  lineup = lineup[ , names( apply(lineup,2,sum) != 0 )[apply(lineup,2,sum) != 0]  ]
  
  final = final[ , !grepl("Player",names(final))]
  final = final[ , !grepl("lineup",names(final))]
  
  
  final = cbind(final,players)
  final = cbind(final,lineup)
  
  
  
  result = final$result
  
  X = final[,-which(names(final) %in% c("result","filename","team"))]
  X = X[ , grepl("lineup",names(X))]
  
  lineupcount = names( apply(X,2,sum)[!apply(X,2,sum) > 19] )
  
  final = final[ , - which(names(final) %in% lineupcount)]
  
  
  X = final[,-which(names(final) %in% c("result","filename","team"))]
  X = X[ , grepl("lineup",names(X))]
  
  loseem = apply(X , 1 , sum) != 0 
  
  final = final[loseem , ]
  result = result[loseem  ]
  
  
  
  X = final
  X = X[ , grepl("lineup",names(X))]
  theLineup = X
  
  
  
  newX = cbind(result,X)
  
  newX = melt(newX,id="result")
  
  newX = newX[newX$value != 0 ,]
  
  
  lineup = newX$variable
  
  n = nrow(X)
  p = length(unique(newX$variable))
  
  modelJAGS <- 
    " model{
  for(i in 1:n){
  
  result[i] ~ dbern(theta[lineup[i]]) 
  
  
  }
  
  for(i in 1:p) {
  
  theta[i] ~ dbeta(10,10)
  
  }
  
  
  
}"

  
  writeLines(modelJAGS,"bern.txt")
  
  
  data.jags <- c('result','lineup','n','p')
  parms <- c('theta')
  bern.sim <- jags(data=data.jags,inits=NULL,parameters.to.save=parms,model.file="bern.txt",n.iter=10000,n.burnin=2000,n.chains=1,n.thin=1) 
  sims <- as.mcmc(bern.sim)
  lineups <- as.data.frame( as.matrix(sims) )
  index = cbind( names(lineups)[grepl('theta\\[',names(lineups))] , 
                 as.numeric( gsub('\\]','',gsub('theta\\[','',names(lineups)[grepl('theta\\[',names(lineups))]))) )
  index = index[order( as.numeric( index[,2] ) ) , ]
  newlineups = lineups[,c(index[,1] , names(lineups)[!grepl('theta\\[',names(lineups))] ) ]
  names(newlineups)[grepl("theta\\[",names(newlineups))] = names(X)
  
  # save.image("CHAINs.RData")
  
  
  
  lineups = data.frame( LINEUPID =  as.character( names( apply(newlineups,2,mean) ) ) , Theta = apply(newlineups,2,median) )
  lineups$LINEUPID = as.character(lineups$LINEUPID)
  
  rownames(lineups) = NULL
  
  lineups = lineups[lineups$LINEUPID != "deviance" , ]
  lineups = lineups[order(lineups$Theta , decreasing = T) , ]
  
  for(i in lineups$LINEUPID){ lineups[lineups$LINEUPID == i , "Count"] = sum(X[,i]) }
  
  lineups
  
  thetaBest = sample(newlineups[ , lineups[1,1] ])
  thetaMost = sample(newlineups[ ,lineups[which(max(lineups$Count) == lineups$Count ),"LINEUPID"] ])
  
  mean( thetaBest > thetaMost )
  
  # lineup = data.frame(`Theta Samples` = thetaBest , Lineup = "Best" )
  # player = data.frame(`Theta Samples` = thetaMost , Lineup = "Most" )
  # 
  # 
  # df = rbind(lineup,player)
  # 
  # 
  # ggplot(df, aes(x=Theta.Samples, fill=Lineup)) +
  #   geom_density(alpha=0.4)+
  #   labs(title="Best vs Most",x="Theta Samples", y = "Density")
  # 
  
  first = lineups[1,1]
  most = lineups[which(max(lineups$Count) == lineups$Count ),"LINEUPID"]
  
  jpeg(paste0('images/',theTEAM,'.jpg'),width = 750,height = 550)
  
  plot(density( newlineups[,most] ),lwd = 4 , col = 'blue',xlim=c(0,1),main = paste(theTEAM,"Lineup Theta Distributions"),xlab = "Theta Samples")
  lines(density( newlineups[,first] ),lwd = 4 , col = 'red')
  
  theLineupNames = names(newlineups)
  
  theLineupNames = theLineupNames[!theLineupNames %in% c("deviance",first,most)]
  
  for(i in theLineupNames ) { lines(density(newlineups[,i]))}
  
  legend("topright", legend=c("Highest", "Most","Others"),
         col=c("red", "blue","black"), lwd=c(4,4,1), cex=0.8)
  
  dev.off()
  
  # invisible(readline(prompt="Press [enter] to continue"))
  
  }

