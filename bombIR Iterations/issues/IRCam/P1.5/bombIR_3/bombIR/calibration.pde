
//-----------------------------------------------------------------------------------------
// CALIBRATION

void runCalibration() {
  background(0);
  textFont(calibFont);
  
  // Read Cam
  if (cam.available() == true) {
    cam.read();
  }
  
  // Show Cam ?
  if(calibShowCam == true) {
    image(cam, 0, 0, FirstScreenWidth, FirstScreenHeight);
  } 
  
  // Show Blob ?
  if(calibShowBlob == true) {
    bd.computeBlobs(cam.pixels);
    CalibdrawBlobsAndEdges(true, true);
  }  
  
  // Draw Text
  fill(255);
  instructions = "Ok... ";  
  //text(instructions, FirstScreenWidth/4, FirstScreenHeight /2); 
  
  // Draw Bounding Box
  stroke(0, 255, 0);
  strokeWeight(2);
  noFill();
  line(LeftBorder, TopBorder, LeftBorder, BottomBorder);
  line(RightBorder, TopBorder, RightBorder, BottomBorder);
  line(LeftBorder, TopBorder, RightBorder, TopBorder);
  line(LeftBorder, BottomBorder, RightBorder, BottomBorder);  

}

//-----------------------------------------------------------------------------------------

