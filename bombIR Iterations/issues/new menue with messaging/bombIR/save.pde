
  //-----------------------------------------------------------------------------------------
  void saveScreen() {
    saveCount ++;
    // save image w/o gui
    pg.save("exports/Save_" + saveCount + ".jpg");
    // save GML file
    saver.save(recorder.getGml(), sketchPath +"/exports/GML_" + saveCount + ".xml");
  }
      
  //-----------------------------------------------------------------------------------------

