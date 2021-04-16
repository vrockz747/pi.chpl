/*
Explaination:

The area of a circle is given by - pi * (r^2)
Now for a circle of radius = 1, the area becomes - pi

The program "area_calculation.chpl" calculates the area of the semi-circle, by summing up the area of large number(numRect) of thin rectangles 
and then multiplying the result(totalSum) with 2.
*/

const numRect = 1e6; // number of rectangles, higher number will result in more precision
const width = 2.0 / numRect; // rectangle width = (diameter / number of rectangles)
config const numThreads = 2; // number of cores the computers processor has
var totalSum: real = 0.0;

proc calculateArea(inside) { 
var partialSum: real = 0.0;
var i: int = inside; // i is the index of current rectangle 
    do {
    partialSum += sqrt( (2*i*width) - ((i*width)**2) ) * width;  // area of one rectangle =  (length * width)
    i += numThreads;
    }
    while (i < numRect);
totalSum += partialSum;
writeln("Thread: ", inside, " totalSum: ", totalSum);
}

sync for i in 1..numThreads {
begin calculateArea(i);
}
writeln("This code estimates pi as ", totalSum*2.00);

