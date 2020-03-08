// Step 1. Declare an object
Fibonacci sequence;

void setup() {
  size(720,640);
  colorMode(HSB, 360, 100, 100);
  // Step 2. Initialize object
  sequence = new Fibonacci();
  noLoop();
}

void draw() {
  sequence.display(5);
}
