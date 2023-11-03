
// https://www.youtube.com/watch?v=ahXIMUkSXX0

void setup()
{
  //size(1000, 1000);
  fullScreen();
  frameRate(60);
}

void draw()
{
  background(0);
  translate(width / 2, height / 2);
  
  
  // Fibonacci Spiral
  stroke(255);
  rectMode(CORNER);
  
  double size_scalar = 5;
  int prevSideLength = 0;
  int sideLength = 1;
  int originX = 0;
  int originY = 0;
  int orientation = 0;  // 0, 1, 2, 3 -> southeast, southwest, northwest, northeast  
  for (int i = 0; i < 20; i++)
  {
    // Draw the square
    //fill(10 * i, 20 * i, 30 * i);
    double rectWidth = sideLength * size_scalar * (orientation % 3 == 0 ? 1 : -1);
    double rectHeight = sideLength * size_scalar * (orientation < 2 ? 1 : -1);
    rect(originX, originY, (float) rectWidth, (float) rectHeight);
    
    // Draw the arc
    noFill();
    switch (orientation)
    {
      case 0:
      arc(originX + (float) (sideLength * size_scalar),
        originY,
        (float) (sideLength * 2 * size_scalar),
        (float) (sideLength * 2 * size_scalar),
        PI, PI + HALF_PI);
      break;
    }
    
    // Prepare the next square
    originX += rectWidth;
    originY += rectHeight;
    orientation = (orientation + 1) % 4;
    // Increment fibonacci sequence
    int temp = sideLength;
    sideLength += prevSideLength;
    prevSideLength = temp;
  }
  
  noLoop();
}
