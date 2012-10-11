
//-----------------------------------------------------------------------------------------

 void brushModes() {
    
    // Current Colour
    pg.stroke(brushR, brushG, brushB, brushA);
    pg.fill(brushR, brushG, brushB, brushA);
    pg.strokeWeight(brushSize);
    pg.strokeJoin(ROUND);
    
    if(mouseY < height - menuHeight) {
      // BRUSH MODES
      if(brushMode == 1) { // CIRCLE
        pg.ellipse(mouseX, mouseY, brushSize, brushSize);
      }
      
      if (brushMode == 2) { // FWD SLASH
        pg.line(pmouseX + brushSize, pmouseY - brushSize, mouseX - brushSize, mouseY + brushSize);
      }
      
      if (brushMode == 3) { // RECT
        pg.rect(mouseX, mouseY, brushSize, brushSize);
      }
      
      if (brushMode == 4) { // SIMPLE LINE
        if(pmouseY < height - menuHeight) {
          if(clicked == true) {
          pg.line(mouseX, mouseY, pm, py);
          //pg.line(mouseX, mouseY, mouseX + 1, mouseY + 1);
          }
        }
      }
      
      if (brushMode == 5) { // FAT CAP
                            // from http://www.openprocessing.org/visuals/?visualID=19923
                            // by USER http://www.openprocessing.org/portal/?userID=9333
        diam = abs(mouseY - height/2) * .125;
        pg.strokeWeight(diam);
        //pg.ellipse(mouseX, mouseY, diam, diam);
        pg.line(mouseX, mouseY, pmouseX, pmouseY);    
      }    
      
      if (brushMode == 6) { // GHETTO PAINT
                            // from http://www.openprocessing.org/visuals/?visualID=2369
                            // by USER http://www.openprocessing.org/portal/?userID=1641
        for(int i = 0; i < 15; i++) {
          float theta = random(0, 4 * PI);
          int radius = int(random(0, 30));
          int x = int(mouseX) + int(cos(theta)*radius);
          int y = int(mouseY) + int(sin(theta)*radius);
          //pg.ellipse(x,y,0.5,0.5);
          pg.point(x,y);
        }
      }
    
      if(brushMode == 7) { // ERASER
          color c = color(0,0);
          pg.beginDraw();
          pg.loadPixels();
          for (int x = 0; x < pg.width; x++) {
            for (int y = 0; y < pg.height; y++ ) {
              float distance = dist(x, y, mouseX, mouseY);
              if (distance <= 25) {
                int loc = x + y * pg.width;
                pg.pixels[loc] = c;
              }
            }
          }
          pg.updatePixels();
          pg.endDraw();
        
      }
      
    }
  }
  
  //-----------------------------------------------------------------------------------------
  

