
 //-----------------------------------------------------------------------------------------
  
  void eraseAll() {
    pg.background(0); // reset background
    if(NumScreens >=2) {
      //s2.background(0); // reset background
    }
//    sendClearScreenMessage();
    recorder.clear(); // clear gml 
    numDrips = 0; // delete drips
  }
  
  //-----------------------------------------------------------------------------------------

