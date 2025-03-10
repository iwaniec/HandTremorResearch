import processing.serial.*;
import java.io.File;

PrintWriter output;
Serial myPort;
boolean collecting = false;
int fileNumber = 1;  // Start from TestTaker1.csv
long startTime = 0;  // Variable to store the start time for each user

void setup() {
  size(400, 200);
  
  println(Serial.list());
  String portName = "COM10";  // Change to your port
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
}

void draw() {
  background(220);
  
  // Start Button
  fill(0, 255, 0);
  rect(50, 50, 100, 50);
  fill(0);
  text("START", 85, 80);

  // Stop Button
  fill(255, 0, 0);
  rect(200, 50, 100, 50);
  fill(0);
  text("STOP", 235, 80);
  
  // Status Text
  fill(0);
  textSize(16);
  text(collecting ? "Collecting Data..." : "Waiting", 150, 150);
}

void mousePressed() {
  if (mouseX > 50 && mouseX < 150 && mouseY > 50 && mouseY < 100) {
    startDataCollection();
  } else if (mouseX > 200 && mouseX < 300 && mouseY > 50 && mouseY < 100) {
    stopDataCollection();
  }
}

void startDataCollection() {
  if (!collecting) {
    // Generate a unique TestTakerX.csv filename
    while (new File(sketchPath("TestTaker" + fileNumber + ".csv")).exists()) {
      fileNumber++;
    }

    String filename = sketchPath("TestTaker" + fileNumber + ".csv");
    output = createWriter(filename);
    output.println("Timestamp, AccX, AccY, AccZ, GyroX, GyroY, GyroZ");  

    myPort.write('S');  // Send start command
    collecting = true;
    
    // Record the start time in milliseconds, reset to 0 for each user
    startTime = millis();
    
    println("Saving data to: " + filename);
  }
}

void stopDataCollection() {
  if (collecting) {
    myPort.write('X');  // Send stop command
    collecting = false;
    
    if (output != null) {
      output.flush();
      output.close();
      println("Data saved.");
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
      output.println(timestamp + "," + join(values, ","));  
      output.flush();
    }
  }
}
