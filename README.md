# Optimal Lineup 2009-10 NBA Data
Do coaches naturally find the optimal lineup in the NBA.

# Introduction
There is no one who knows a NBA team better than the coach. Coaches are tasked with training their players, preparing for games, and managing games. The question that I pose is are coaches inherently finding and using their best lineup of players or could they be allocating minutes to better lineups.


=======
# Model

For this project, we only included a team’s lineup if it appeared in at least 3 games. The dependent variable is whether or not the team scored on a shot. We used a Bernoulli likelihood to model the data, with parameter ![theta](https://latex.codecogs.com/gif.latex?%7B%5Ctheta_i%7D) where i goes from 1 to the number of unique five player lineups a team has. We used a beta prior with parameters 1 and 1 for each ![theta](https://latex.codecogs.com/gif.latex?%7B%5Ctheta%7D).

Model<br/>
Likelihood<br/>
![first equation](https://latex.codecogs.com/gif.latex?%7By_i%20%24%5Csim%24%20Bern%28%5Ctheta_i%20%29%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%20j%3D1%2C...%2Cm%2Ci%3D1%2C...%2Cn%7D)<br/><br/>
Prior<br/>
![first equation](https://latex.codecogs.com/gif.latex?%7B%5Ctheta_i%20%24%5Csim%24%20Beta%281%2C1%29%20%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%5C%2C%20i%3D1%2C...%2Cn%7D)

# Hypothesis 

I wanted to see if the lineup that was used the most was also the most efficient, or has the highest probability of scoring. To do this for a given team we compare the posterior distribution for each ![theta](https://latex.codecogs.com/gif.latex?%7B%5Ctheta%7D) and we can see how each lineup differs or does not differ in probability of scoring.

# Results

For the results, I’ve included plots of the posterior distribution for each lineup of a team. The highest probability of scoring lineup is red and the most used lineup is blue. For this write up I have only included a few team’s distribution. I've included every plot in the  [images](https://github.com/jamesyh/optimal-lineups/tree/master/images) folder.



Good:<br/>
![alt text](https://github.com/jamesyh/optimal-lineups/blob/master/images/BOS.jpg)<br/>
Bad:<br/>
![alt text](https://github.com/jamesyh/optimal-lineups/blob/master/images/CLE.jpg)<br/>
Interesting:<br/>
![alt text](https://github.com/jamesyh/optimal-lineups/blob/master/images/OKC.jpg)<br/>
![alt text](https://github.com/jamesyh/optimal-lineups/blob/master/images/WAS.jpg)<br/>

# Conclusion
Some teams do a fine job at finding a good lineup and using it a lot, like Boston for example. Other teams don't do as well, like Cleveland. Then there are teams like Oklahoma that have one lineup that they use way more than any other or there are teams like Washington who have several lineups they use almost equally with differing probabilities of scoring. 

Coaches know their teams much better than what the numbers tell us. Cleveland and Washington may have used a less optimal lineup because of injury or minute restrictions. Or maybe they didn't want to make their star’s player too tired. Coaches have differing opinions about minutes during the regular season. For example, the Spurs have lots of different lineups they used during the season. That way they get to the playoffs and aren't exhausted during them. Then there are the Thunder who have to ride their stars and play them a lot to make it to the playoffs and that’s why we don't see as many highly used lineups.
