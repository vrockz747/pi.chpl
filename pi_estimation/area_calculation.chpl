const numRect = 1e6; //number of rectangles, higher number will result in more precision
const width = 2.0 / numRect; // rectangle width
config const numThreads = 2; // number of cores the computers processor has
var globalSum: real = 0.0;

proc calculateArea(inside) {
var partialSum: real = 0.0;
var x: real;
var i: int = inside;
    do {

    partialSum += sqrt((2*i*width) - ((i*width)**2))*width;
    i += numThreads;
    }
    while (i < numRect);
globalSum += partialSum;
writeln("Thread: ", inside, " globalSum: ", globalSum);
}

sync for i in 1..numThreads {
begin calculateArea(i);
}

writeln("This code estimates pi as ", globalSum*2.00);