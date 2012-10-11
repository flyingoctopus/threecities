
//-----------------------------------------------------------------------------------------

void gui() {

  background(0);
  
  // Color Picker
  image(cp, 0, height - cpSize * 1.1);
  
  // Buttons
  image(circle, 0,   height - cpSize * 1.1);
  image(chisel, 100, height - cpSize * 1.1);
  image(spray, 200, height - cpSize * 1.1);
  image(drip, 300, height - cpSize * 1.1);
  image(eraser, 600, height - cpSize * 1.1);

  // Circle  
  if(drawX > 0  && drawX < 100) {
    if(clicked = true) {    
      brush.set("uniqueStyleID", Circle.ID);
      brushMode = 1;
      brushPicked = 12;
    }
  }      
  
  // SLASH
  if(drawX > 100  && drawX < 200) {
    if(clicked = true) {  
      brush.set("uniqueStyleID", FwdSlash.ID);
      brushMode = 2;
      brushPicked = 110;
    }
  } 
  
  // SPRAY
  if(drawX > 200  && drawX < 300) {
    if(clicked = true) {  
      brush.set("uniqueStyleID", GhettoPaint.ID);
      brushMode = 3;
      brushPicked = 210;
    }
  } 

  // DRIPS
  if(drawX > 300  && drawX < 400) {
    if(clicked = true) {  
      dripsIO =! dripsIO;
      
      if(dripsIO == true) dripsPicked = 255;
      if(dripsIO == false) dripsPicked = 0;
      
    }
  }    
  
  // PICKER
  if(drawX > 475 - cpSize && drawX < 475) {
    if(clicked = true) {    
      picker = get(int(drawX), int(drawY));
      brushR = red(picker);
      brush.set("red", ""+brushR);
      brushG = green(picker);
      brush.set("green", ""+brushG);
      brushB = blue(picker);
      brush.set("blue", ""+brushB);         
    }
  }
  pushStyle();
    fill(brushR, brushG, brushB);
    rect(575 - cpSize, height - cpSize * 1.1, cpSize, cpSize);
  popStyle();  

  // ERASER
  if(drawX > 600  && drawX < 700) {
    if(clicked = true) {  
      dripsIO = false;
      //brush.set("uniqueStyleID", Eraser.ID);
      brushMode = 4;
      brushPicked = 610;
    }
  } 

  // SIZE
  if(drawX > 700  && drawX < 950) {
    if(clicked = true) {  
      if(drawX > 700  && drawX < 720) {
        brushSize = 2;
        sizePicked = 695;
      }
      else if(drawX > 720  && drawX < 745) {
        brushSize = 5;
        sizePicked = 720;
      }
      else if(drawX > 745  && drawX < 785) {
        brushSize = 10;
        sizePicked = 745;
      }
      else if(drawX > 785  && drawX < 835) {
        brushSize = 15;
        sizePicked = 785;
      }
      else if(drawX > 835  && drawX < 895) {
        brushSize = 25;
        sizePicked = 835;
      }
      else if(drawX > 895  && drawX < 920) {
        brushSize = 35;
        sizePicked = 895;
      }      
    }
  } 
 
  // BRYSH SIZE
  pushStyle();
    smooth();
    fill(255);
    ellipse(700, height - 50, 2, 2);
    ellipse(725, height - 50, 5, 5);
    ellipse(750, height - 50, 10, 10);
    ellipse(790, height - 50, 15, 15);
    ellipse(840, height - 50, 25, 25);
    ellipse(900, height - 50, 35, 35);
  popStyle();
  
  // MARKERS
  pushStyle();
    smooth();
    strokeCap(ROUND);
    strokeWeight(4);
    stroke(255, 0, 0);
    // Brush Marker
    line(brushPicked, height - 15, brushPicked + 50, height - 15);
    // Size Marker
    line(sizePicked, height - 15, sizePicked + 10, height - 15);
    stroke(dripsPicked, 0, 0);
    // Drips Marker
    line(312, height - 15, 365, height - 15);
  popStyle();
  
  // Cursor
  if(DrawMode != 1) {
    if(showCursor == true) {
      image(circle, drawX, drawY, 15, 15); 
    } 
  }

}

//-----------------------------------------------------------------------------------------
