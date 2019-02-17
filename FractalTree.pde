private double fractionLength = .8; 
private int smallestBranch = 8; 
private double branchAngle = .5;  

public void setup() 
{   
  size(640, 480);    
  noLoop();
} 

public void draw() 
{   
  background(#3F0450);  
  stroke(#714811); 
  strokeWeight(3);
  line(320, 480, 320, 100); 

  //320 & 380 = endpoint of the trunk/starting point of two branches
  //100 = lenth of trunk
  //3*Math.PI/2 = angle of trunk
  drawBranches(320, 380, 100, 3*Math.PI/2);
} 

public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  double angle1, angle2;
  int endX1, endY1, endX2, endY2;

  //V-shape of branches
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;

  //Shorter length of the new branch
  branchLength *= fractionLength;

  //Calculate the endpoints
  endX1 = (int)(branchLength*Math.cos(angle1) + x);
  endY1 = (int)(branchLength*Math.sin(angle1) + y);
  endX2 = (int)(branchLength*Math.cos(angle2) + x);
  endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  //1st generation: new branch
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength < 10)
  {
    stroke(#FFCBF1);
    strokeWeight(2);
  }
  else if (branchLength < 15)
   {
    stroke(#EA58E1);
    strokeWeight(2.5);
  } 
  else if (branchLength < 25)
  {
    stroke(#743068);
    strokeWeight(2.5);
  }
  else if (branchLength < 85)
  {
    stroke (#E369CD);
    strokeWeight(1.5);
  }
  
  //Recursion
  if (branchLength > smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 