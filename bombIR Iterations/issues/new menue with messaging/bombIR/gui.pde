
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
  image(clear, 600, height - cpSize * 1.1);
  image(eraser, 700, height - cpSize * 1.1);
  //image(circle, 800,   height - cpSize * 1.1);


  // Circle  
  if(mouseX > 0  && mouseX < 100) {
    if(mousePressed) {    
      brush.set("uniqueStyleID", Circle.ID);
      brushMode = 1;
      pickedX = 12;
    }
  }      
  
  // SLASH
  if(mouseX > 100  && mouseX < 200) {
    if(mousePressed) {  
      brush.set("uniqueStyleID", FwdSlash.ID);
      brushMode = 2;
      pickedX = 110;
    }
  } 
  
  // SPRAY
  if(mouseX > 200  && mouseX < 300) {
    if(mousePressed) {  
      brush.set("uniqueStyleID", GhettoPaint.ID);
      brushMode = 6;
      pickedX = 210;
    }
  } 

  // DRIPS
  if(mouseX > 300  && mouseX < 400) {
    if(mousePressed) {  
      dripsIO =! dripsIO;
      
      if(dripsIO == true) mark = 255;
      if(dripsIO == false) mark = 0;
      
    }
  }    
  
  // PICKER
  if(mouseX > 475 - cpSize && mouseX < 475) {
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
  pushStyle();
    fill(brushR, brushG, brushB);
    rect(575 - cpSize, height - cpSize * 1.1, cpSize, cpSize);
  popStyle();  

  // CLEAR
  if(mouseX > 600  && mouseX < 700) {
    if(mousePressed) {  
      eraseAll();
      sendClearScreenMessage();
    }
  } 

  // ERASER
  if(mouseX > 700  && mouseX < 800) {
    if(mousePressed) {  
      dripsIO = false;
      brushMode = 7;
      pickedX = 710;
      brush.set("uniqueStyleID", Eraser.ID);
    }
  } 

  // SIZE
  if(mouseX > 800  && mouseX < 900) {
    if(mousePressed) {  
      brushSize += 5;
      if(brushSize >= 50) {
        brushSize = 5; 
      }
      brush.set("size", ""+brushSize);
      println("Brush Size is " + brushSize);
    }
  } 
 
 
  // BRYSH SIZE
  pushStyle();
    smooth();
    fill(255);
    line(pickedX, height - 15, pickedX + 50, height - 15);
    stroke(mark, 0, 0);
    line(312, height - 15, 365, height - 15);
  popStyle();
  
  // MARKERS
  pushStyle();
    smooth();
    strokeCap(ROUND);
    strokeWeight(4);
    stroke(255, 0, 0);
    line(pickedX, height - 15, pickedX + 50, height - 15);
    stroke(mark, 0, 0);
    line(312, height - 15, 365, height - 15);
  popStyle();

}

//-----------------------------------------------------------------------------------------
