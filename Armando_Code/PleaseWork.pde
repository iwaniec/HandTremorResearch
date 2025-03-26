import processing.serial.*;
import java.io.File;

Serial myPort;
PrintWriter positionOutput;  // For positions.txt
PrintWriter testTakerOutput; // For TestTakerX.csvint step;
int step;
int fileIndex = 1;
boolean collecting = false;
int fileNumber = 1;  // Start from TestTaker1.csv
long startTime;  // Variable to store the start time for each user
long startTimePositions;

void setup() {
  // Find the next available file name
  while (new File(sketchPath("positions_" + fileIndex + ".txt")).exists()) {
    fileIndex++;
  }
  
  // Create a uniquely numbered positions file
  String positionFilename = "positions_" + fileIndex + ".txt";
  positionOutput = createWriter(positionFilename); 

  //size(800,600);
  fullScreen();
  //surface.setResizable(true); //lets user resize while game is open
  background (150,175,100); // select the color of the background - green
  startTimePositions = millis();
  step = 1;
  
  
  //println(Serial.list());prints out a list of available serial ports
  String portName = "COM10";  // Change to your port
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
}
void draw() {
  float timeElapsed = (millis() - startTimePositions) / 1000.0;
  shapes_and_instructions();
  circle(mouseX, mouseY, 5); // draw a point at the current mouse position
  positionOutput.println(timeElapsed + "\t" + mouseX + "\t" + mouseY); // Write the coordinate to the file
}
void drawArrow(float x, float y, float size) {
  float arrowLength = size * 0.33;   // Adjust arrow length relative to circle size
  float arrowHeadSize = size * 0.2; // Adjust arrowhead size
  float offset = arrowHeadSize * 0.3; // Small shift to the right

  stroke(0);                        // Black color for arrow
  strokeWeight(4);                  // Thicker line for better visibility
  line(x - arrowLength / 2, y, x + arrowLength / 2, y); // Arrow shaft

  // Arrowhead (triangle)
  fill(0); // Black color for arrowhead
  noStroke();
  triangle(x + arrowLength / 2 + offset, y, 
           x + arrowLength / 2 - arrowHeadSize + offset, y - arrowHeadSize * 0.4, 
           x + arrowLength / 2 - arrowHeadSize + offset, y + arrowHeadSize * 0.4);
}



void shapes_and_instructions() {
  
  
  switch (step) {
    case 1:
    
      background (204, 255, 255);
      textAlign(CENTER);
      textSize(60);
      fill(0); //black color for rectangles
      text("Move the mouse around and click the start", width/2, 160);
      text("button when you are ready to play the game.", width/2, 240);
      text("Try your best to stay within the lines and click", width/2, 320);
      text("the corresponding number to move forward.", width/2, 400);
      fill(102, 255, 102); // Green color for the button
      circle(width*.04, height*.07, 120);
      fill(0); // Black color for the button
      textSize(40);  // Smaller text size for the button text
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      text("START", width * 0.04, height * 0.07);  // Position the "START" text in the center of the button
      break;
    case 2:
      background (217,255,139); // select the color of the background - green
      fill(0, 0, 0); //black color for text
      textAlign(CENTER);
      textSize(60);
      text("Follow the path and click the number", width/2, 170);
      text("at the end of the path to move forward.", width/2, 240);
      fill(204, 255,255); //light blue for the rectangle and circle
      rect(width*.04, height*.06, width*.93, height*.03);// Top rectangle
      circle(width*.04, height*.07, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.04, height * 0.07);  // Position the "START" text in the center of the button
      fill(204, 255,255); //light blue
      circle(width*.97, height*.07, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", width * 0.97, height * 0.07);  // Position the "START" text in the center of the button
      fill(204, 255,255); //light blue
      startDataCollection();
      break;
      
    case 3:
      background (217,255,139); // select the color of the background - green
      fill(0, 0, 0); //black color for rectangles
      textAlign(CENTER);
      textSize(60);
      text("Follow the path and click the number", width/2, 170);
      text("at the end of the path to move forward.", width/2, 240);
      
      fill(204, 255,255); //light blue
      rect(width*.04, height*.06, width*.93, height*.03); // Top rectangle
      rect(width*.96, height*.1, width*.02, height*.83); //Right rectangle
      
      circle(width*.04, height*.07, 100);  //#1      
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for rectangles
      text("1", width * 0.04, height * 0.07);  // Position the "1" text in the center of the button
      fill(204, 255,255); //light blue
      
      circle(width*.97, height*.07, 100);  //#2
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for rectangles
      text("2", width * 0.97, height * 0.07);  // Position the "START" text in the center of the button
      fill(204, 255,255); //light blue
      
      circle(width*.97, height*.9, 100); // #3
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for rectangles
      text("3", width * 0.97, height * 0.9);  // Position the "START" text in the center of the button
      fill(204, 255,255); //light blue
      break;
    case 4:
     background (217,255,139); // select the color of the background - green
     fill(0, 0, 0); // Black color for rectangle
     textAlign(CENTER);
     textSize(60);
     text("Follow the path and click the number", width/2, 170);
     text("at the end of the path to move forward.", width/2, 240); 
     fill(204, 255,255); //light blue
     rect(width*.04, height*.06, width*.93, height*.03); // Top rectangle  
     rect(width*.96, height*.1, width*.02, height*.83); //Right rectangle
     rect(width*.04, height*.89,  width*.93, height*.03); // Bottom rectangle
     circle(width*.04, height*.07, 100);
     textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
     fill(0, 0, 0); //black color for rectangles
     text("1", width * 0.04, height * 0.07);  // Position the "START" text in the center of the button
     fill(204, 255,255); //light blue
     circle(width*.97, height*.07, 100);
     textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
     fill(0, 0, 0); //black color for rectangles
     text("2", width * 0.97, height * 0.07);  // Position the "START" text in the center of the button
     fill(204, 255,255); //light blue
     circle(width*.97, height*.9, 100); 
     textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
     fill(0, 0, 0); //black color for rectangles
     text("3", width * 0.97, height * 0.9);  // Position the "START" text in the center of the button
     fill(204, 255,255); //light blue
     circle(width*.04, height*.9, 100);
     textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
     fill(0, 0, 0); //black color for rectangles
     text("4", width * 0.04, height * 0.9);  // Position the "START" text in the center of the button
     fill(204, 255,255); //light bluefill(204, 255,255); //light blue
     break;
    case 5:
     background (217,255,139); // select the color of the background - green
     fill(0, 0, 0); // Black color for rectangle
     textAlign(CENTER);
     textSize(60);
     text(" Follow the path and click 'Next'             ", width/2, 170);
     text("at the end of the path to move forward.", width/2, 240);
     
     fill(204, 255,255); //light blue for All Rectangles
     rect(width*.04, height*.06, width*.93, height*.03);    //Top rectangle 
     rect(width*.96, height*.1, width*.02, height*.83);     //Right rectangle
     rect(width*.04, height*.89,  width*.93, height*.03);   //Bottom rectangle
     rect(width*.029, height*.065,  width*.02, height*.83); //Left rectangle
     fill(102, 255, 102); // Green color for the next button
     circle(width*.04, height*.07, 100);//#1 ~ Next
     fill(0, 0, 0); //black color for rectangles
     textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
     textSize(45);  // Text size 
     text("Next", width * 0.04, height * 0.07);  // Position the "START" text in the center of the button
     fill(204, 255,255); //light blue for #2
     textSize(60);  // Text size 
     circle(width*.97, height*.07, 100);//2
     textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
     fill(0, 0, 0); //black color for rectangles
     text("2", width * 0.97, height * 0.07);  // Position the "START" text in the center of the button
     fill(204, 255,255); //light blue for #3
     circle(width*.97, height*.9, 100);  //bottom right ~ #3
     textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
     fill(0, 0, 0); //black color for rectangles
     text("3", width * 0.97, height * 0.9);  // Position the "START" text in the center of the button     
     fill(204, 255,255); //light blue  for #4     
     circle(width*.04, height*.9, 100);   //bottom left ~ #4
     textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
     fill(0, 0, 0); //black color for rectangles
     text("4", width * 0.04, height * 0.9);  // Position the "START" text in the center of the button
     fill(204, 255,255); //light bluefill(204, 255,255); //light blue
     break;
       
    case 6:
      background (110,180,255);
      textAlign(CENTER);
      textSize(60);
      text("Follow the path and click the number", width/2, 170);
      text("at the end of the path to move forward.", width/2, 240);
      fill(204, 255,255); //Color of triangles and Diagnol Line ~ Light Blue
      quad (82, 117, 92, 94, 1792, 876, 1782, 899);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      fill(204, 255,255);
      
      triangle(25, 137, 150, 137, 87.5, 45); //#1
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.046, 97); // Position the "1" text in the center of the button
      fill(204, 255,255);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);//#2
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("2", 1790 ,880); // Position the "2" text in the center of the button
      break;
      
    case 7:
      background (110,180,255);
      textAlign(CENTER);
      textSize(60);
      text("Follow the path and click the number", width/2, 170);
      text("at the end of the path to move forward.", width/2, 240);
      fill(204, 255, 255); //Color of triangle and Diagnol Lines ~ Light Blue
      quad (82, 117, 92, 94, 1792, 876, 1782, 899);
      quad (87.5, 900, 87.5, 875, 1787, 875, 1787, 900);
      triangle(25, 137, 150, 137, 87.5, 45); //#1
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.046, 97); // Position the "1" text in the center of the button
      fill(204, 255,255);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);//#2
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("2", 1790 ,880); // Position the "2" text in the center of the button
      fill(204, 255,255);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("3", 87.5 ,880); // Position the "3" text in the center of the button
      break;
    
    case 8:
      background (110,180,255);
      textAlign(CENTER);
      textSize(60);
      text("Follow the path and click the number", width/2, 170);
      text("at the end of the path to move forward.", width/2, 240);
      fill(204, 255, 255); //Color of triangle and Diagnol Lines ~ Light Blue
      quad (82, 117, 92, 94, 1792, 876, 1782, 899);
      quad (87.5, 900, 87.5, 875, 1787, 875, 1787, 900);
      quad (92, 899, 82, 876, 1782, 94, 1792, 117);
      triangle(25, 137, 150, 137, 87.5, 45);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.046, 97); // Position the "1" text in the center of the button
      fill(204, 255,255);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);//#2
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("2", 1790 ,880); // Position the "2" text in the center of the button
      fill(204, 255,255);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("3", 87.5 ,880); // Position the "3" text in the center of the button
      fill(204, 255,255); //changes triangle to light blue
      triangle(1725, 137, 1850, 137, 1787.5, 45);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("4", 1785 ,100); // Position the "3" text in the center of the button
      break;
      
    case 9:
      background (110,180,255);
      textAlign(CENTER);
      textSize(60);
      text("Follow the path and click 'Next'             ", width/2, 170);
      text("at the end of the path to move forward.", width/2, 240);
      fill(204, 255, 255); //Color of triangle/ Diagnol Lines/ straight ~ Light Blue
      quad (87.5, 90, 87.5, 115, 1787, 115, 1787, 90);// top line
      quad (82, 117, 92, 94, 1792, 876, 1782, 899);
      quad (87.5, 900, 87.5, 875, 1787, 875, 1787, 900);//bottom line
      quad (92, 899, 82, 876, 1782, 94, 1792, 117);// diagnoal bottom left to top right
      fill(102, 255, 102); // Green color for the next button
      triangle(25, 137, 150, 137, 87.5, 45);
      fill(204, 255,255);  // green color
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      textSize(40);  // Text size 
      text("Next", width * 0.046, 115); // Position the "1" text in the center of the button
      fill(204, 255,255);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);//#2
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      textSize(60);  // Text size 
      text("2", 1790 ,880); // Position the "2" text in the center of the button
      fill(204, 255,255);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("3", 87.5 ,880); // Position the "3" text in the center of the button
      fill(204, 255,255); //changes triangle to light blue
      triangle(1725, 137, 1850, 137, 1787.5, 45);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the triangle
      fill(0, 0, 0); //black color for text
      text("4", 1785 ,100); // Position the "3" text in the center of the button
      break;
      
      

      
    case 10:
      background (200,180,200);
      text("Follow the path and click the number", width/2, 965);
      text("at the end of the path to move forward.", width/2, 1030);
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      
      circle(80, 70, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.042, 70);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(526.25,880,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 526.9, 879);  // Position the "START" text in the center of the button
      

      break;
      
    case 11:
      background (200,180,200);
      text("Follow the path and click the number", width/2, 965);
      text("at the end of the path to move forward.", width/2, 1030);
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      circle(80, 70, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.042, 70);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(526.25,880,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 526.9, 879);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(972.5,70,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("3", 972.5, 70);  // Position the "START" text in the center of the button
       
      break;
    
    case 12:
      background (200,180,200);
      text("Follow the path and click the number", width/2, 965);
      text("at the end of the path to move forward.", width/2, 1030);
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      quad (961, 76, 983, 63, 1429, 873, 1407, 886);
      circle(80, 70, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.042, 70);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(526.25,880,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 526.9, 879);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(972.5,70,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("3", 972.5, 70);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(1418.75,880,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("4", 1418, 880);  // Position the "START" text in the center of the button
      
      break;
      
    case 13:
      background (200,180,200);
      text("Follow the path and click the number", width/2, 965);
      text("at the end of the path to move forward.", width/2, 1030);
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      quad (961, 76, 983, 63, 1429, 873, 1407, 886);
      quad (1429, 886, 1407, 873, 1854, 63, 1875, 76);
      circle(80, 70, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.042, 70);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(526.25,880,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 526.9, 879);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(972.5,70,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("3", 972.5, 70);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(1418.75,880,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("4", 1418, 880);  // Position the "START" text in the center of the button
           
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(1865, 70, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("5", 1865, 70);  // Position the "START" text in the center of the button
           
      break; 
    case 14:
      background (200,180,200);
      text("Follow the path and click 'Next'             ", width/2, 965);
      text("at the end of the path to move forward.", width/2, 1030);
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (972, 60, 972, 85, 1865, 85, 1865, 60);// top line
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      quad (961, 76, 983, 63, 1429, 873, 1407, 886);
      quad (1429, 886, 1407, 873, 1854, 63, 1875, 76);
      
      circle(80, 70, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", width * 0.042, height * 0.057);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(526.25,880,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 526.9, 879);  // Position the "START" text in the center of the button
      
      fill(102, 255, 102); // Green color for the next button
      circle(972.5,70,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      textSize(45);
      text("Next", 972.5, 70);  // Position the "START" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(1418.75,880,100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      textSize(60);
      text("4", 1418, 880);  // Position the "START" text in the center of the button
           
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle(1865, 70, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("5", 1865, 70);  // Position the "START" text in the center of the button
           
      break; 
 
 



      
    case 15:
      background (255,186,221); // select the color of the background - pink
      textSize(50);

      fill(204, 255,255); //light blue
      circle (972, 500, 720);
      fill(255,186,221); //light blue
      circle (972, 500, 670);
      
      fill(102, 255, 102);//green
      circle (972, 150, 100);
      // Draw arrow inside the small circle
      // Draw arrow inside the small circle
      drawArrow(1020, 157, 100); // Calls your function to draw the arrow

      fill (0);   
      text("Follow the circle back to your", width/1.97, 410);
      text("initial position and then click", width/1.97, 480);
      text("the arrow to move forward.", width/1.97, 550);
      textSize(35);
      text("Start", 972, 130);
      text("here", 972, 170);

      

      break;
    
    case 16:

      background (232,208,255);
      textAlign(CENTER);
      textSize(60);
      fill(0);
      text("You're almost done!", width/2, 300);
      text("Click the shape to move forward!", width/2, 380);
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (972, 150, 150);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      textSize(50);
      text("Click", 972, 125);  // Position the "START" text in the center of the button
      text("me!", 972, 175);  // Position the "START" text in the center of the button

      break; 
      
    case 17:
      background (232,208,255);
      textSize(60);
      fill(0);
      text("Follow the path and click the number", width/3.6, 930);
      text("at the end of the path to move forward.", width/3.6, 1000);
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (968, 161, 975, 138, 1803, 388, 1796, 411);
      
      circle (972, 150, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", 972, 150);  // Position the "1" text in the center of the button
  
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (1800, 400, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 1800.9, 400);  // Position the "2" text in the center of the button
      
      break; 
      
    case 18:
      background (232,208,255);
      text("Follow the path and click the number", width/3.6, 930);
      text("at the end of the path to move forward.", width/3.6, 1000);
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (968, 161, 975, 138, 1803, 388, 1796, 411);
      quad (1797, 387, 1802, 412, 102, 712, 97, 687);
      circle (972, 150, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", 972, 150);  // Position the "1" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (1800, 400, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 1800.9, 400);  // Position the "2" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (100, 700, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("3", 100, 700);  // Position the "3" text in the center of the button
     

      break; 
      
    case 19:
      background (232,208,255);
      text("Follow the path and click the number", width/3.6, 930);
      text("at the end of the path to move forward.", width/3.6, 1000);
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (968, 161, 975, 138, 1803, 388, 1796, 411);
      quad (1797, 387, 1802, 412, 102, 712, 97, 687);
      quad (97, 712, 102, 687, 1312, 947, 1307, 972);
      
      circle (972, 150, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", 972, 150);  // Position the "1" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (1800, 400, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 1800.9, 400);  // Position the "2" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (100, 700, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("3", 100, 700);  // Position the "3" text in the center of the button
     
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (1310, 960, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("4", 1310, 960);  // Position the "3" text in the center of the button
       
      break;
      
     
    case 20:
      background (232,208,255);
      text("Follow the path and click the number", width/3.6, 930);
      text("at the end of the path to move forward.", width/3.6, 1000);
      fill(204, 255, 255); //Color of circles ~ Light Blue
      quad (968, 161, 975, 138, 1803, 388, 1796, 411);
      quad (1797, 387, 1802, 412, 102, 712, 97, 687);
      quad (97, 712, 102, 687, 1312, 947, 1307, 972);
      quad(1310, 950, 1330, 930, 80, 70, 100, 110);  // Adjusted to align with circle (1310, 960)
      circle (972, 150, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("1", 972, 150);  // Position the "1" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (1800, 400, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("2", 1800.9, 400);  // Position the "2" text in the center of the button
      
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (100, 700, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("3", 100, 700);  // Position the "3" text in the center of the button
     
      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (1310, 960, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("4", 1310, 960);  // Position the "3" text in the center of the button

      fill(204, 255, 255); //Color of circles ~ Light Blue
      circle (80, 79, 100);
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      fill(0, 0, 0); //black color for text
      text("5", 80, 79);  // Position the "3" text in the center of the button
     
      break;
      
    case 21:
      background (232,208,255);
      textAlign(CENTER);
      textSize(60);
      text("Great Job!", width/2, 150);
      text("Thank you for playing! ", width/2, 220);
      text("Click the 'End' button to finish the game! ", width/2, 300);
      
      fill(255, 90, 90); // Green color for the button
      circle (980, 500,175);
      fill(0); // Black color for the button
      textSize(80);  // Smaller text size for the button text
      textAlign(CENTER, CENTER); // Ensure text is centered inside the circle
      text("END", 980, 500);  // Position the "START" text in the center of the button
      break;
    
    case 22:
      keyPressed();
  }
}
  

void mouseClicked() {
  positionOutput.flush(); // Writes the remaining data to the file
  positionOutput.println("Mouse Click");
  step++;
    
}



void keyPressed() {
  stopDataCollection();
  positionOutput.close(); // Finishes the file
  positionOutput.close();
  exit(); // Stops the program
}


void startDataCollection() {
  if (!collecting) {
    // Generate a unique TestTakerX.csv filename
    while (new File(sketchPath("TestTaker" + fileNumber + ".csv")).exists()) {
      fileNumber++;
    }
    String filename = sketchPath("TestTaker" + fileNumber + ".csv");
    testTakerOutput  = createWriter(filename);
    testTakerOutput.println("Timestamp, AccX, AccY, AccZ, GyroX, GyroY, GyroZ");  
    myPort.write('S');      // Send start command
    collecting = true;
    startTime = millis();    // Record the start time in milliseconds, reset to 0 for each user
    println("Saving data to: " + filename);
  }
}
void stopDataCollection() {
  if (collecting) {
    myPort.write('X');  // Send stop command
    collecting = false;
    
    if (testTakerOutput != null) {
      testTakerOutput.flush();
      testTakerOutput.close();
      println("TestTaker data saved.");
    }
  }
}
void serialEvent(Serial myPort) {
  String data = myPort.readStringUntil('\n');
  
  if (data != null && collecting) {
    data = trim(data);
    println("Received: " + data);  // Debugging: Check what data was received
    
    String[] values = split(data, ',');
    
    if (values.length == 6) {  
      // Calculate the timestamp as the elapsed time since this user's data collection started
      String timestamp = nf((millis() - startTime) / 1000.0, 0, 4);  // Convert to seconds with 4 decimal places
      testTakerOutput.println(timestamp + "," + join(values, ","));  
      testTakerOutput.flush();
    }
  }
}
