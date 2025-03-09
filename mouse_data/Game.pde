PrintWriter output;
int step;

void setup() {
  // Create a new file in the sketch directory
  output = createWriter("positions.txt"); 
  size(800,600);
//  size(1950,990);
  fullScreen();
  //surface.setResizable(true); //lets user resize while game is open
  background (150,175,100); // select the color of the background
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
      textSize(60);
      text("Move mouse to circle", width/2, 150);
      text("and click ", width/2, 220);
      circle(width*.04, height*.07, 75);
      break;
      
    case 2:
      textAlign(CENTER);
      textSize(60);
      text("Follow each path and click the shape", width/2, 170);
      text("at the end of the path ", width/2, 240);
      rect(width*.05, height*.065, width*.92, height*.02);
      circle(width*.04, height*.07, 75);
      circle(width*.97, height*.07, 75);
      break;
      
    case 3:
     rect(width*.05, height*.065, width*.92, height*.02);
     rect(width*.965, height*.1, width*.0125, height*.83);
     circle(width*.04, height*.07, 75);
     circle(width*.97, height*.07, 75);
     circle(width*.97, height*.9, 75); 
     break;

    case 4:
     rect(width*.05, height*.065, width*.92, height*.02);
     rect(width*.965, height*.1, width*.0125, height*.83);
     rect(width*.04, height*.89,  width*.92, height*.02);
     circle(width*.04, height*.07, 75);
     circle(width*.97, height*.07, 75);
     circle(width*.97, height*.9, 75); 
     circle(width*.04, height*.9, 75);
     break;
     
    case 5:
     rect(width*.05, height*.065, width*.92, height*.02);
     rect(width*.965, height*.1, width*.0125, height*.83);
     rect(width*.04, height*.89,  width*.92, height*.02);
     rect(width*.035, height*.065,  width*.0125, height*.83);
     circle(width*.04, height*.07, 75);
     circle(width*.97, height*.07, 75);
     circle(width*.97, height*.9, 75); 
     circle(width*.04, height*.9, 75);
     break;
    
    case 6:
      background (110,180,255);
      textAlign(CENTER);
      textSize(60);
      text("Click the shape for", width/2, 150);
      text("the next level", width/2, 220);
      triangle(25, 137, 150, 137, 87.5, 45);
      //triangle(50, 100, 100, 100, 75, 50);
      break;
     
    case 7:
      background (110,180,255);
      quad (82, 117, 92, 94, 1792, 876, 1782, 899);
      triangle(25, 137, 150, 137, 87.5, 45);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);
      break;
      
    case 8:
      background (110,180,255);
      quad (82, 117, 92, 94, 1792, 876, 1782, 899);
      quad (87.5, 900, 87.5, 875, 1787, 875, 1787, 900);
      triangle(25, 137, 150, 137, 87.5, 45);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      break;
    
    case 9:
      background (110,180,255);
      quad (82, 117, 92, 94, 1792, 876, 1782, 899);
      quad (87.5, 900, 87.5, 875, 1787, 875, 1787, 900);
      quad (92, 899, 82, 876, 1782, 94, 1792, 117);
      triangle(25, 137, 150, 137, 87.5, 45);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      triangle(1725, 137, 1850, 137, 1787.5, 45);
      break;
      
    case 10:
      background (110,180,255);
      textAlign(CENTER);
      textSize(60);
      text("Great Job!", width/2, 150);
      text("Keep Going!", width/2, 220);
      triangle(1725, 137, 1850, 137, 1787.5, 45);
      break;
      
    case 11:
      background (110,180,255);
      quad (92, 899, 82, 876, 1782, 94, 1792, 117);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      triangle(1725, 137, 1850, 137, 1787.5, 45);
      break;
      
    case 12:
      background (110,180,255);
      quad (87.5, 900, 87.5, 875, 1787, 875, 1787, 900);
      quad (92, 899, 82, 876, 1782, 94, 1792, 117);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      triangle(1725, 137, 1850, 137, 1787.5, 45);
      break;
    
    case 13:
      background (110,180,255);
      quad (82, 117, 92, 94, 1792, 876, 1782, 899);
      quad (87.5, 900, 87.5, 875, 1787, 875, 1787, 900);
      quad (92, 899, 82, 876, 1782, 94, 1792, 117);
      triangle(25, 137, 150, 137, 87.5, 45);
      triangle(1725, 918.5, 1850, 918.5, 1787.5, 826.5);
      triangle(25, 918.5, 150, 918.5, 87.5, 826.5);
      triangle(1725, 137, 1850, 137, 1787.5, 45);
      break;
      
    case 14:
      background (200,180,200);
      circle(80, 70, 75);
      break;
      
    case 15:
      background (200,180,200);
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      circle(80, 70, 75);
      circle(526.25,880,75);
      break;
      
    case 16:
      background (200,180,200);
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      circle(80, 70, 75);
      circle(526.25,880,75);
      circle(972.5,70,75);
      break;
    
    case 17:
      background (200,180,200);
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      quad (961, 76, 983, 63, 1429, 873, 1407, 886);
      circle(80, 70, 75);
      circle(526.25,880,75);
      circle(972.5,70,75);
      circle(1418.75,880,75);
      break;
      
    case 18:
      background (200,180,200);
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      quad (961, 76, 983, 63, 1429, 873, 1407, 886);
      quad (1429, 886, 1407, 873, 1854, 63, 1875, 76);
      circle(80, 70, 75);
      circle(526.25,880,75);
      circle(972.5,70,75);
      circle(1418.75,880,75);
      circle(1865, 70, 75);
      break; 
      
    case 19:
      background (200,180,200);
      circle(1865, 70, 75);
      break;
      
    case 20:
      background (200,180,200);
      quad (1429, 886, 1407, 873, 1854, 63, 1875, 76);
      circle(1418.75,880,75);
      circle(1865, 70, 75);
      break;
      
    case 21:
      background (200,180,200);
      quad (961, 76, 983, 63, 1429, 873, 1407, 886);
      quad (1429, 886, 1407, 873, 1854, 63, 1875, 76);
      circle(972.5,70,75);
      circle(1418.75,880,75);
      circle(1865, 70, 75);
      break;
      
    case 22:
      background (200,180,200);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      quad (961, 76, 983, 63, 1429, 873, 1407, 886);
      quad (1429, 886, 1407, 873, 1854, 63, 1875, 76);
      circle(526.25,880,75);
      circle(972.5,70,75);
      circle(1418.75,880,75);
      circle(1865, 70, 75);
      break;
      
      case 23:
      background (200,180,200);
      quad (69, 76, 90, 63, 537, 873, 515, 886);
      quad (537, 886, 515, 873, 961, 63, 983, 76);
      quad (961, 76, 983, 63, 1429, 873, 1407, 886);
      quad (1429, 886, 1407, 873, 1854, 63, 1875, 76);
      circle(80, 70, 75);
      circle(526.25,880,75);
      circle(972.5,70,75);
      circle(1418.75,880,75);
      circle(1865, 70, 75);
      break;   
    
    case 24:
      background (200,180,200);
      quad (78, 82, 81, 57, 973, 137, 970, 162);
      circle(80, 70, 75);
      circle (972, 150, 75);
      break;
      
    case 25:
      circle (972, 150, 75);
      break;
      
    case 26:
      circle (972, 500, 720);
      fill (150,175,100);
      circle (972, 500, 670);
      fill (255);
      circle (972, 150, 75);
      textAlign(CENTER);
      textSize(50);
      text("Follow the circle back to", width/2, 475);
      text("your initial position", width/2, 535);
      break;
    
    case 27:
      background (105,90,120);
      textAlign(CENTER);
      textSize(60);
      text("Almost done!", width/2, 250);
      circle (972, 150, 75);
      break; 
      
    case 28:
      background (105,90,120);
      quad (968, 161, 975, 138, 1803, 388, 1796, 411);
      circle (972, 150, 75);
      circle (1800, 400, 75);
      break; 
      
    case 29:
      background (105,90,120);
      quad (968, 161, 975, 138, 1803, 388, 1796, 411);
      quad (1797, 387, 1802, 412, 102, 712, 97, 687);
      circle (972, 150, 75);
      circle (1800, 400, 75);
      circle (100, 700, 75);
      break; 
      
    case 30:
      background (105,90,120);
      quad (968, 161, 975, 138, 1803, 388, 1796, 411);
      quad (1797, 387, 1802, 412, 102, 712, 97, 687);
      quad (97, 712, 102, 687, 1312, 947, 1307, 972);
      circle (972, 150, 75);
      circle (1800, 400, 75);
      circle (100, 700, 75);
      circle (1310, 960, 75);
      break;
      
     
    case 31:
      background (105,90,120);
      circle (1310, 960, 75);
      break;
    
    case 32:
      background (105,90,120);
      quad (97, 712, 102, 687, 1312, 947, 1307, 972);
      circle (100, 700, 75);
      circle (1310, 960, 75);
      break;
    
    case 33:
      background (105,90,120);
      quad (1797, 387, 1802, 412, 102, 712, 97, 687);
      quad (97, 712, 102, 687, 1312, 947, 1307, 972);
      circle (1800, 400, 75);
      circle (100, 700, 75);
      circle (1310, 960, 75);
      break;
    
    case 34:
      background (105,90,120);
      quad (968, 161, 975, 138, 1803, 388, 1796, 411);
      quad (1797, 387, 1802, 412, 102, 712, 97, 687);
      quad (97, 712, 102, 687, 1312, 947, 1307, 972);
      circle (972, 150, 75);
      circle (1800, 400, 75);
      circle (100, 700, 75);
      circle (1310, 960, 75);
      break;
      
    case 35:
      background (105,90,120);
      textAlign(CENTER);
      textSize(60);
      text("Great Job!", width/2, 150);
      text("Thank you for playing! ", width/2, 220);
      break;
    
    case 36:
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
