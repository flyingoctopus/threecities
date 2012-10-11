
  //-----------------------------------------------------------------------------------------
  
  void mousePressed() {
    clicked = true;
    
    //set randomseed for brush to reproduce randomness
    timer.start();
    if(brush.getStyleID().equals(GhettoPaint.ID)){
      randomSeed(1);
    	brush.set("randomseed", "1");
    }
    
    // Start recording if not already
    recorder.beginStroke(0, saveCount, brush);
    
    //begin recording for messaging
    messagingRecorder.beginStroke(0,0, brush);

    // Frame Counter
    frameCount = 0;
    currFrame = frameCount;

  }
  
  void mouseDragged () {
    clicked = true;

    // Set UI safe zone
    if(mouseY < height-55) {  

      // Frame Counter
      elapsedFrame = frameCount - currFrame;
      float eF = elapsedFrame / 100;
      String eff = nf(eF, 1, 2);

      // Add points to GML stroke
      Vec3D v = new Vec3D((float) mouseX/FirstScreenWidth, (float) mouseY/FirstScreenHeight, 0);
      recorder.addPoint(0, v, float(eff));

      //for messaging
      timer.tick();
      messagingRecorder.addPoint(0,v,timer.getTime());
    }
  }
  
  void mouseReleased() {
    clicked = false;

    // End current GML stroke
    recorder.endStroke(0);

    //sending message 
    //TODO add test if stroke got points to not send empty stroke messages
    messagingRecorder.endStroke(0);
    String gmlxml = GmlSavingHelper.getGMLXML(messagingRecorder.getGml());
    sendStrokeMessage(gmlxml);
    messagingRecorder.clear();
    timer.reset();
  }
  
  //-----------------------------------------------------------------------------------------
