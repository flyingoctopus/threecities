
//-----------------------------------------------------------------------------------------

void gui() {

  background(0);
  
  // Color Picker
  image(cp, 0, height - cpSize * 1.1);
  
  // Buttons
  image(circle, 0,   height - cpSize * 1.1);
  image(chisel, 100, height - cpSize * 1.1);
  image(marker, 200, height - cpSize * 1.1);
  image(pencil, 300, height - cpSize * 1.1);
  image(fatcap, 400, height - cpSize * 1.1);
  image(spray,  500, height - cpSize * 1.1);
  image(drip,   600, height - cpSize * 1.1);
  image(eraser, 700, height - cpSize * 1.1);
  
  // Rects
  noFill();
  stroke(255);
  
  //rect(10, height - cpSize, 50, 50);

  // Click

  if(mouseX > 0  && mouseX < 100) {
    if(mousePressed) {    
      // Circle  
      brush.set("uniqueStyleID", Circle.ID);
      brushMode = 1;
    }
  }      

  if(mouseX > 100  && mouseX < 200) {
    if(mousePressed) {  
      // SLASH
      brush.set("uniqueStyleID", FwdSlash.ID);
      brushMode = 2;
    }
  } 

  if(mouseX > 200  && mouseX < 300) {
    if(mousePressed) {  
      // MARKER
      brush.set("uniqueStyleID", FwdSlash.ID);
      brushMode = 3;
    }
  } 

  if(mouseX > 300  && mouseX < 400) {
    if(mousePressed) {  
      // LINE
      brush.set("uniqueStyleID", SimpleLine.ID);
      brushMode = 4;
    }
  }       
  
  if(mouseX > 400  && mouseX < 500) {
    if(mousePressed) {  
      // FATCAP
      brush.set("uniqueStyleID", FatCap.ID);
      brush.set("height", ""+height);
      brushMode = 5;
    }
  } 
  
  if(mouseX > 500  && mouseX < 600) {
    if(mousePressed) {  
      // SPRAY
      brush.set("uniqueStyleID", GhettoPaint.ID);
      brushMode = 6;
    }
  } 

  if(mouseX > 600  && mouseX < 700) {
    if(mousePressed) {  
      // DRIPS
      dripsIO =! dripsIO;
    }
  } 

  if(mouseX > 700  && mouseX < 800) {
    if(mousePressed) {  
      // DRIPS
      //eraseAll();
      brushMode = 7;
    }
  } 

  
  if(mouseX > menuWidth - cpSize && mouseX < menuWidth) {
    if(mousePressed) {    
      picker = get(mouseX, mouseY);
      brushR = red(picker);
      brush.set("red", ""+brushR);
      brushG = green(picker);
      brush.set("green", ""+brushG);
      brushB = blue(picker);
      brush.set("blue", ""+brushB);         
    }
  }

  fill(brushR, brushG, brushB);
  rect(930 - cpSize, height - cpSize * 1.1, cpSize, cpSize);


}

//-----------------------------------------------------------------------------------------
