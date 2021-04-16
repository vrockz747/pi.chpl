/* 
Explaination:

A Monte Carlo simulation is a model used to predict the probability of different outcomes when the intervention of random variables is present.

The program "MC_simulation" uses this method to estimate the value of - pi

Lets consider a circle with center (0,0) with radius = 'r', and a square with side length = '2r' and center at (0,0) and one vertex at (r,r) 

Now consider the area of the figures only in the first quadrant,
if we select any random point inside the square region, 
the probability of the point to fall inside the circular region = (area of circle / area of square)

area of circle = ( pi * (r^2) / 4 )   (since only the first quad is considered)
area of sq = (r^2) (since only the first quad is considered)

therefore, probability  = pi / 4

also, by taking random points; probability = (number of points inside circle) / (number of points inside the square) --------equation(1)

therefore, pi = 4 * equation(1)

A more precise value can be obtained by taking the mean of 10 or more results obtained from the program.
*/

use Random;

//Defining required variables
config const n = 100000; //higher value of n will result in more precise estimation

var D : domain(1) = {1..n};
var rands: [D] real;

fillRandom(rands); //filling the array with random values between 0 and 1

var circle_points = 0.0; //number of points inside circle
var noncircle_points = 0.0; //number of points outside circle (non_circle)

var rand_x : real; //x-coordinate of point
var rand_y : real; //y-coordinate of point
var origin_dist : real; //distance of point from origin

var randStream = new RandomStream(real);

for i in D{
  rand_x = randStream.choice(rands); //choosing random-x from the array
  rand_y = randStream.choice(rands); //choosing random-y from the array
        
  origin_dist = (rand_x*rand_x + rand_y*rand_y);

  if (origin_dist <= 1){
    circle_points += 1;
  }
  else{
    noncircle_points += 1;
  }
}

var pi : real = 4 * (circle_points/(noncircle_points + circle_points));
writeln("This program estimates pi as ",pi);

