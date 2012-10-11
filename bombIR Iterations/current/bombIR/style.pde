  //-----------------------------------------------------------------------------------------
  
  void style() {
    
    if(mouseY < height-menuHeight) {
      // Call Current Brush
      brushModes();
      
      // If Slow, Add Drip
      if(mouseX - pmouseX < 4 && mouseX - pmouseX > -4) {
        drip(); 
      } 
      
    }
    
  } 
  
 //-----------------------------------------------------------------------------------------
 
 
