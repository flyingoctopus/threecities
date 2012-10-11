
 //-----------------------------------------------------------------------------------------
 // CP5 
  
 // COLOR + SIZE
 
 void WIDTH(int BrushSize) {
    brushSize = (BrushSize);
    //set brush for messaging
    brush.set("size", ""+BrushSize);
  }
  
 void BRUSH_A(int BrushA) {
    brushA = (BrushA);
    brush.set("alpha", ""+BrushA);
  } 
 
 // STYLES
 
 void CR(boolean theFlag) {
  if(theFlag == true) {
    brush.set("uniqueStyleID", Circle.ID);
    brushMode = 1;
  }
 } 

 void FW(boolean theFlag) {
  if(theFlag == true) {
  	brush.set("uniqueStyleID", FwdSlash.ID);
    brushMode = 2;
  }
 } 

 void LN(boolean theFlag) {
  if(theFlag == true) {
    brush.set("uniqueStyleID", SimpleLine.ID);
    brushMode = 3;
  }
 }

 void FC(boolean theFlag) {
  if(theFlag == true) {
    brush.set("uniqueStyleID", FatCap.ID);
    brush.set("height", ""+height);
    brushMode = 5;
  }
 }
 
void SP(boolean theFlag) {
  if(theFlag == true) {
    brush.set("uniqueStyleID", GhettoPaint.ID);
    brushMode = 6;
  }
 }

 // CLEAR
 void CLEAR(boolean theFlag) {
  if(theFlag == true) {
    eraseAll();
    sendClearScreenMessage();
  }
 }  
 
 // SAVE
  
 void SAVE(boolean theFlag) {
  if(theFlag == true) {
    saveScreen = true;
  }
 } 
 
 // DRIPS
 
 void DRIPS(boolean theFlag) {
    if(theFlag == true) {
      dripsIO = true;
    } else if (theFlag == false) {
      dripsIO = false;
    }
 }
  

