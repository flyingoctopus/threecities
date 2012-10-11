
//-----------------------------------------------------------------------------------------
// MODES

// Mouse
void drawModeOne() {
  drawX = mouseX;
  drawY = mouseY;
}

// Camera Tracking

void captureEvent(Capture cam) {
  cam.read();
  newFrame = true;
}

void drawModeTwo() {
  //println("Mode 2");
  
  // Show Camera Image
//  if (cam.available() == true) {
//    //println("Cam Ready ? \t" + cam.available());
//    cam.read();
//  }

  if (newFrame) {
    newFrame = false;
    //image(cam,0,0,width,height);
    img.copy(cam, 0, 0, cam.width, cam.height, 
        0, 0, img.width, img.height);
    //fastblur(img, 2);
    bd.computeBlobs(img.pixels);
    drawBlobsAndEdges(true,true);
  }
  
  //pg.image(cam, 0, 0);
  pg.image(cam, 0, 0, FirstScreenWidth, FirstScreenHeight);
 
  // Blob Detection  
  bd.computeBlobs(cam.pixels);
  //drawBlobsAndEdges(true, false);

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

