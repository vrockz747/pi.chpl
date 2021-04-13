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



