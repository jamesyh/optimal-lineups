# Optimal Lineup 2009-10 NBA Data
Do coaches naturally find the optimal lineup in the NBA.

# Introduction
There is no one who knows a NBA team better than the coach. Coaches are tasked with training their players, preparing for games, and managing games. The question that I pose is are coaches inherently finding and using their best lineup of players. Or could they be allocating minutes to better lineups.

# Model

For this project we only included a teams lineup if it appeared in at least 3 games. The dependent variable is wether or not the team scored on a shot. We used a Bernoulli likelihood to model the data, with parameter ![theta](https://latex.codecogs.com/gif.latex?%7B%5Ctheta_i%7D) where i goes from 1 to the number of unique five player lineups a team has. We used a beta prior with parameters 1 and 1 for each ![theta](https://latex.codecogs.com/gif.latex?%7B%5Ctheta%7D).

Model<br/>
Likelihood<br/>
![first equation](https://latex.codecogs.com/gif.latex?%7By_i%20%24%5Csim%24%20Bern%28%5Ctheta_i%20%29%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%20j%3D1%2C...%2Cm%2Ci%3D1%2C...%2Cn%7D)<br/><br/>
Prior<br/>
![first equation](https://latex.codecogs.com/gif.latex?%7B%5Ctheta_i%20%24%5Csim%24%20Beta%281%2C1%29%20%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%20i%3D1%2C...%2Cn%7D)

# Hypothosis 

I wanted to see if the lineup that was used the most was also the most efficient, or has the highest probability of scoring. To do this for a given team we compare the posterior distribution for each ![theta](https://latex.codecogs.com/gif.latex?%7B%5Ctheta%7D) and we can see how each lineup differs or does not differ in probability of scoring.

# Results

For the results i've included plots of the posterior distribution for each lineup of a team. The highest probability of scoring lineup is red and the most used lineup is blue. For this write up I have only included a few teams distribution. I've included every plot in the  [images](https://github.com/jamesyh/optimal-lineups/tree/master/images) folder.



Good:<br/>
![alt text](https://github.com/jamesyh/optimal-lineups/blob/master/images/BOS.jpg)<br/>
Bad:<br/>
![alt text](https://github.com/jamesyh/optimal-lineups/blob/master/images/CLE.jpg)<br/>
Interesting:<br/>
![alt text](https://github.com/jamesyh/optimal-lineups/blob/master/images/OKC.jpg)<br/>
![alt text](https://github.com/jamesyh/optimal-lineups/blob/master/images/WAS.jpg)<br/>
