## Pi Estimation through Monte Carlo Simulation & Semi-Circle Area Calculation (Parallel Computing) - Chapel
This repository contains experiments to estimate the value of pi using Monte Carlo simulation and Calculating the area of a unit-circle using parallel computing in Chapel. The test aims to explore parallel computing concepts and high-performance computation.

Prerequisites
Before running the test, make sure you have the following dependencies installed on your Linux machine:

Chapel Compiler: Download and install the latest version of the Chapel programming language  
from the official Chapel website: [Chapel Download](https://chapel-lang.org/download.html)

### MC Simulation:
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

### Area of a Unit-Circle
The area of a circle is given by - pi * (r^2)
Now for a circle of radius = 1, the area becomes - pi

The program "area_calculation.chpl" calculates the area of the semi-circle, by summing up the area of large number(numRect) of thin rectangles 
and then multiplying the result(totalSum) with 2.
