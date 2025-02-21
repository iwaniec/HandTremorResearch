PrintWriter output;
float xPos;       // Horizontal position of goal
float yPos;       // Vertical position of goal

void setup() {
  // Create a new file in the sketch directory
  output = createWriter("positions.txt"); 

  size (800,600);
  smooth();
  size (800,600);
  smooth();
  xPos=width/2;     // Horizontal start position of goal
  yPos=height/2;    // Veritical start position of goal
}

void draw() {
  circle(xPos, yPos, 50);
  circle(mouseX, mouseY, 5); // draw a point at the current mouse position
  output.println(mouseX + "\t" + mouseY); // Write the coordinate to the file
  
  
}

void mouseClicked() {
  output.flush(); // Writes the remaining data to the file
  output.println("Mouse Click");
  
}

void keyPressed() {
  output.close(); // Finishes the file
  exit(); // Stops the program
}
