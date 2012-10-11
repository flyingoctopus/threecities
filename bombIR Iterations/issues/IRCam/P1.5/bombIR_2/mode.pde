
//-----------------------------------------------------------------------------------------
// MODES

// Mouse
void drawModeOne() {
  drawX = mouseX;
  drawY = mouseY;
}

// Camera Tracking
void drawModeTwo() {

  // Show Camera Image
  if (cam.available() == true) {
    cam.read();
  }
  //pg.image(cam, 0, 0, FirstScreenWidth, FirstScreenHeight);
 
  // Blob Detection 
  pg.background(0); 
  bd.computeBlobs(cam.pixels);
  drawBlobsAndEdges(true, false);

  
  // Draw
  drawX = blobX;
  drawY = blobY;  
  
  // Touched
  if(blobIO == 1 && prevBlobFrame == 0) {
    strokeOn();
  }
  
  if(blobIO == 1 && prevBlobFrame == 1) {
    strokeOnAndOn(); 
  }
  
  // Released
  if(blobIO == 0 && prevBlobFrame == 1) {
    strokeOff();
  }  

  // Update Frame
  prevBlobFrame = blobIO;

}

// Remote OSC
void drawModeThree() {
  

}

// GML Data
void drawModeFour() {

  
}

//-----------------------------------------------------------------------------------------

