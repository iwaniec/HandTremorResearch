PrintWriter output;
int step;

void setup() {
  // Create a new file in the sketch directory
  output = createWriter("positions.txt"); 
  size(800,600);
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
      textSize(40);
      text("Move mouse to circle", width/2, 100);
      text("and click ", width/2, 150);
      circle(75, 75, 50);
      break;
      
    case 2:
      textAlign(CENTER);
      textSize(40);
      text("Follow each path and click the shape", width/2, 150);
      text("at the end of the path ", width/2, 200);
      rect(70, 70, 690, 10);
      circle(70, 75, 50);
      circle(width-40, 75, 50);
      break;
      
    case 3:
     rect(70, 70, 690, 10);
     rect(755, 75, 10, 500);
     circle(70, 75, 50);
     circle(width-40, 75, 50);
     circle(760, 550, 50);
     break;

    case 4:
     rect(70, 70, 690, 10);
     rect(755, 75, 10, 500);
     circle(70, 75, 50);
     circle(width-40, 75, 50);
     rect(75, 545, 690, 10);
     circle(760, 550, 50);
     circle(75, 550, 50);
     break;
     
    case 5:
      rect(70, 70, 690, 10);
      rect(755, 75, 10, 500);
      rect(70, 75, 10, 500);
      circle(70, 75, 50);
      circle(width-40, 75, 50);
      rect(75, 545, 690, 10);
      circle(760, 550, 50);
      circle(75, 550, 50);
      break;
    
    case 6:
      background (110,180,255);
      textAlign(CENTER);
      textSize(40);
      text("Click the shape for", width/2, 150);
      text("the next level", width/2, 200);
      triangle(50, 100, 100, 100, 75, 50);
      break;
     
    case 7:
      background (110,180,255);
      quad (75, 75, 67, 85, 702, 540, 710, 530);
      triangle (50, 100, 100, 100, 75, 50);
      triangle (690, 550, 740, 550, 715, 500);
      break;
      
    case 8:
      background (110,180,255);
      quad (75, 75, 67, 85, 702, 540, 710, 530);
      quad (710, 525, 710, 537, 75, 537, 75, 525);
      triangle (50, 100, 100, 100, 75, 50);
      triangle (690, 550, 740, 550, 715, 500);
      triangle (50, 550, 100, 550, 75, 500);
      break;
    
    case 9:
      background (110,180,255);
      quad (75, 75, 67, 85, 702, 540, 710, 530);
      quad (710, 525, 710, 537, 75, 537, 75, 525);
      quad (710, 75, 718, 85, 83, 540, 75, 530);
      triangle (50, 100, 100, 100, 75, 50);
      triangle (690, 550, 740, 550, 715, 500);
      triangle (50, 550, 100, 550, 75, 500);
      triangle (690, 100, 740, 100, 715, 50);
      break;
      
    case 10:
      background (110,180,255);
      textAlign(CENTER);
      textSize(40);
      text("Great Job!", width/2, 150);
      text("Keep Going!", width/2, 200);
      triangle (690, 100, 740, 100, 715, 50);
      break;
      
    case 11:
      background (110,180,255);
      quad (710, 75, 718, 85, 83, 540, 75, 530);
      triangle (690, 100, 740, 100, 715, 50);
      triangle (50, 550, 100, 550, 75, 500);
      break;
      
    case 12:
      background (110,180,255);
      quad (710, 75, 718, 85, 83, 540, 75, 530);
      quad (710, 525, 710, 537, 75, 537, 75, 525);
      triangle (690, 550, 740, 550, 715, 500);
      triangle (50, 550, 100, 550, 75, 500);
      triangle (690, 100, 740, 100, 715, 50);
      break;
    
    case 13:
      background (110,180,255);
      quad (75, 75, 67, 85, 702, 540, 710, 530);
      quad (710, 525, 710, 537, 75, 537, 75, 525);
      quad (710, 75, 718, 85, 83, 540, 75, 530);
      triangle (50, 100, 100, 100, 75, 50);
      triangle (690, 550, 740, 550, 715, 500);
      triangle (50, 550, 100, 550, 75, 500);
      triangle (690, 100, 740, 100, 715, 50);
      break;
      
    case 14:
      background (200,180,200);
      circle (75, 75, 50);
      break;
      
    case 15:
      background (200,180,200);
      quad (70, 75, 80, 75, 238, 525, 228, 525);
      circle (75, 75, 50);
      circle (238, 525, 50);
      break;
      
    case 16:
      background (200,180,200);
      quad (70, 75, 80, 75, 238, 525, 228, 525);
      quad (242, 525, 232, 525, 395, 75, 405, 75);
      circle (75, 75, 50);
      circle (238, 525, 50);
      circle (400, 75, 50);
      break;
    
    case 17:
      background (200,180,200);
      quad (70, 75, 80, 75, 238, 525, 228, 525);
      quad (242, 525, 232, 525, 395, 75, 405, 75);
      quad (400, 75, 410, 75, 562, 525, 552, 525);
      circle (75, 75, 50);
      circle (238, 525, 50);
      circle (400, 75, 50);
      circle (562, 525, 50);
      break;
      
    case 18:
      background (200,180,200);
      quad (70, 75, 80, 75, 238, 525, 228, 525);
      quad (242, 525, 232, 525, 395, 75, 405, 75);
      quad (400, 75, 410, 75, 562, 525, 552, 525);
      quad (572, 525, 562, 525, 725, 75, 735, 75);
      circle (75, 75, 50);
      circle (238, 525, 50);
      circle (400, 75, 50);
      circle (562, 525, 50);
      circle (725, 75, 50);
      break; 
      
    case 19:
      background (200,180,200);
      circle (725, 75, 50);
      break;
      
    case 20:
      background (200,180,200);
      quad (572, 300, 562, 300, 725, 75, 735, 75);
      circle (725, 75, 50);
      circle (562, 300, 50);
      break;
      
    case 21:
      background (200,180,200);
      quad (572, 300, 562, 300, 725, 75, 735, 75);
      quad (400, 75, 410, 75, 562, 300, 552, 300);
      circle (725, 75, 50);
      circle (562, 300, 50);
      circle (400, 75, 50);
      break;
      
    case 22:
      background (200,180,200);
      quad (572, 300, 562, 300, 725, 75, 735, 75);
      quad (400, 75, 410, 75, 562, 300, 552, 300);
      quad (242, 300, 232, 300, 395, 75, 405, 75);
      circle (725, 75, 50);
      circle (562, 300, 50);
      circle (400, 75, 50);
      circle (238, 300, 50);
      break;
      
      case 23:
      background (200,180,200);
      quad (572, 300, 562, 300, 725, 75, 735, 75);
      quad (400, 75, 410, 75, 562, 300, 552, 300);
      quad (242, 300, 232, 300, 395, 75, 405, 75);
      quad (70, 75, 80, 75, 238, 300, 228, 300);
      circle (725, 75, 50);
      circle (562, 300, 50);
      circle (400, 75, 50);
      circle (238, 300, 50);
      circle (75, 75, 50);
      break;   
    
    case 24:
      background (200,180,200);
      quad (75, 79, 75, 70, 400, 95, 400, 105);
      circle (400, 100, 50);
      circle (75, 75, 50);
      break;
      
    case 25:
      circle (400, 100, 50);
      break;
      
    case 26:
      circle (400, 300, 420);
      fill (150,175,100);
      circle (400, 300, 390);
      fill (255);
      circle (400, 100, 50);
      textAlign(CENTER);
      textSize(35);
      text("Follow the circle back to", width/2, 250);
      text("your intital position", width/2, 300);
      break;
    
    case 27:
      background (105,90,120);
      textAlign(CENTER);
      textSize(40);
      text("Almost done!", width/2, 250);
      circle (400, 100, 50);
      break; 
      
    case 28:
      background (105,90,120);
      quad (397, 104, 402, 95, 702, 245, 697, 254);
      circle (400, 100, 50);
      circle (700, 250, 50);
      break; 
      
    case 29:
      background (105,90,120);
      quad (397, 104, 402, 95, 702, 245, 697, 254);
      quad (698, 245, 701, 254, 101, 454, 98, 445);
      circle (400, 100, 50);
      circle (700, 250, 50);
      circle (100, 450, 50);
      break; 
      
    case 30:
      background (105,90,120);
      quad (397, 104, 402, 95, 702, 245, 697, 254);
      quad (698, 245, 701, 254, 101, 454, 98, 445);
      quad (98, 454, 101, 445, 401, 545, 398, 554);
      circle (400, 100, 50);
      circle (700, 250, 50);
      circle (100, 450, 50);
      circle (400, 550, 50);
      break;
      
     
    case 31:
      background (105,90,120);
      circle (400, 550, 50);
      break;
    
    case 32:
      background (105,90,120);
      quad (98, 454, 101, 445, 401, 545, 398, 554);
      circle (400, 550, 50);
      circle (100, 450, 50);
      break;
    
    case 33:
      background (105,90,120);
      quad (98, 454, 101, 445, 401, 545, 398, 554);
      quad (698, 245, 701, 254, 101, 454, 98, 445);
      circle (400, 550, 50);
      circle (100, 450, 50);
      circle (700, 250, 50);
      break;
    
    case 34:
      background (105,90,120);
      quad (98, 454, 101, 445, 401, 545, 398, 554);
      quad (698, 245, 701, 254, 101, 454, 98, 445);
      quad (397, 104, 402, 95, 702, 245, 697, 254);
      circle (400, 550, 50);
      circle (100, 450, 50);
      circle (700, 250, 50);
      circle (400, 100, 50);
      break;
      
    case 35:
      background (105,90,120);
      textAlign(CENTER);
      textSize(40);
      text("Great Job!", width/2, 150);
      text("Thank you for playing! ", width/2, 200);
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
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}
