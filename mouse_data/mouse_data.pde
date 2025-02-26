PrintWriter output;
int step;

void setup() {
  // Create a new file in the sketch directory
  output = createWriter("positions.txt"); 
  size(800,600);
  background (150,175,100); // select the color of the backgroun
  step = 1;
}


void draw() {
  shapes_and_instructions();
  circle(mouseX, mouseY, 5); // draw a point at the current mouse position
  output.println(mouseX + "\t" + mouseY); // Write the coordinate to the file
  
  
}

void shapes_and_instructions() {
  
  
  switch (step) {
    case 1:
      textAlign(CENTER);
      textSize(40);
      text("Move mouse to circle", width/2, 100);
      text("and click ", width/2, 150);
      circle(20, 25, 50);
      break;
      
    case 2:
      rect(20, 20, width-40, 10);
      circle(width-40, 25, 50);
      break;
      
    case 3:
      keyPressed();
  }
}
  

void mouseClicked() {
  output.flush(); // Writes the remaining data to the file
  output.println("Mouse Click");
  background (150,175,100); // select the color of the background
  step++;
    
}

void keyPressed() {
  output.close(); // Finishes the file
  exit(); // Stops the program
}
