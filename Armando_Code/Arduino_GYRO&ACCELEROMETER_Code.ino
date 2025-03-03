#include <Arduino_LSM9DS1.h>
#include <ArduinoBLE.h>

// Define variables for storing accelerometer and gyroscope data
float ax, ay, az;  // Acceleration data
float gx, gy, gz;  // Gyroscope data

// BLE Service and Characteristics
BLEService tremorService("180D");  // Create a BLE service
BLEFloatCharacteristic accelXChar("2A59", BLERead | BLENotify);  // X-axis accelerometer data
BLEFloatCharacteristic accelYChar("2A5A", BLERead | BLENotify);  // Y-axis accelerometer data
BLEFloatCharacteristic accelZChar("2A5B", BLERead | BLENotify);  // Z-axis accelerometer data
BLEFloatCharacteristic gyroXChar("2A5C", BLERead | BLENotify);   // X-axis gyroscope data
BLEFloatCharacteristic gyroYChar("2A5D", BLERead | BLENotify);   // Y-axis gyroscope data
BLEFloatCharacteristic gyroZChar("2A5E", BLERead | BLENotify);   // Z-axis gyroscope data

void setup() {
  Serial.begin(115200);

  // Start BLE communication
  if (!BLE.begin()) {
    Serial.println("Starting BLE failed!");
    while (1);
  }

  // Set up the sensor
  if (!IMU.begin()) {
    Serial.println("IMU initialization failed!");
    while (1);
  }

  // Start the BLE service
  BLE.setLocalName("TremorMonitor");
  BLE.setAdvertisedService(tremorService);
  tremorService.addCharacteristic(accelXChar);
  tremorService.addCharacteristic(accelYChar);
  tremorService.addCharacteristic(accelZChar);
  tremorService.addCharacteristic(gyroXChar);
  tremorService.addCharacteristic(gyroYChar);
  tremorService.addCharacteristic(gyroZChar);
  BLE.addService(tremorService);

  // Start advertising the BLE service
  BLE.advertise();
  Serial.println("BLE service started, waiting for connections...");
}

void loop() {
  BLE.poll();

  if (IMU.accelerationAvailable()) {
    IMU.readAcceleration(ax, ay, az);
    IMU.readGyroscope(gx, gy, gz);

    // Send formatted data over Serial (Processing will read this)
    Serial.print(ax); Serial.print(",");
    Serial.print(ay); Serial.print(",");
    Serial.print(az); Serial.print(",");
    Serial.print(gx); Serial.print(",");
    Serial.print(gy); Serial.print(",");
    Serial.println(gz);  // Newline to indicate end of data row

    delay(10);  // Small delay to avoid overwhelming Processing
  }
}

