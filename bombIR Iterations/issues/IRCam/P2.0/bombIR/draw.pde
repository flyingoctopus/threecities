 
//-----------------------------------------------------------------------------------------
// DRAW

void draw() {
  
  if(calibrate == true) {
    runCalibration();
    //println("CALIBRATING...");
  }
  else {   
    // 
    
    // Buffer
    pg.beginDraw();
      pg.smooth();
      
      // Call Brushes If Drawing
      if(clicked == true) {
        //style();
      }
      
      // GUI
      if(drawY > height - menuHeight) {
        gui();
        showCursor = true;
      }
      else if(drawY < height - menuHeight) {
        background(0);
        showCursor = false;
      }
      
      // Draw Mode
      if(DrawMode == 1) {
        // Mouse Control
        drawModeOne();
      }
      else if(DrawMode == 2) {
        // Camera Control
        //captureEvent(cam);
        drawModeTwo();  
      }
      else if(DrawMode == 3) {
        // Remote Control
        drawModeThree();
      }
      else if(DrawMode == 4) {
        // Data Control
        drawModeFour();    
      }
    
      // Draw Drips
      if(dripsIO == true) {
        for(int i = 0; i < numDrips; i++) {
          drips[i].drip();
          drips[i].show();
          drips[i].stopping();
        }
      }
    pg.endDraw();
    
    // Buffer Image
    //image(pg, 0, 0);
     
    // FPS
    if(frameCount % 120 == 0) {
      int fps = round(frameRate); 
      println("FPS " + fps);
    }
  
  }
} // end DRAW
  
//-----------------------------------------------------------------------------------------

