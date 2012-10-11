
//-----------------------------------------------------------------------------------------
// CALIBRATION

void runCalibration() {
  background(0);
  
  // Show Camera Image
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0, FirstScreenWidth, FirstScreenHeight);
    
  bd.computeBlobs(cam.pixels);
  drawBlobsAndEdges(false ,true);
  println(frameRate);
  // P2D   17fps
  // J2D   11fps
  // OGL   
}
