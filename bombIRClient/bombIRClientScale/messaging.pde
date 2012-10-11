
//-----------------------------------------------------------------------------------------
// MESSAGING METHODS 

void onMessageArrival(String messageText, String messageType){
  System.out.println("Message: " + messageText); 
  System.out.println("MessageType: " + messageType); 
  if(messageType.equals("CLEAR")){
    pg.background(0);
    currentGml = null;
    gmlQ.clear();
          
  }else{
  
    Gml gml = GmlParsingHelper.getGmlFromString(messageText, false);
    List<GmlStroke> strokes = (List<GmlStroke>)gml.getStrokes();
    if(strokes.size() < 1){
      	return;
    }     
    gmlQ.put(gml);
    if(currentGml == null){
      gmlEvent(new GmlStrokeEndEvent(new GmlStroke()));
      println("event fired");
    }
  }
}
    
void stop(){
      try{
        messageConsumer.close();
      }catch(JMSException ex){
        System.out.println(ex.getMessage());
      }
}
    
 void gmlEvent(GmlEvent event) {
      if (event instanceof GmlStrokeEndEvent){
        if(gmlQ.size() > 0){
          currentGml = gmlQ.get();
          dm.setGml(currentGml);
          ctime.start();
        }else{
          currentGml = null;
        }
      }
  }    

//-----------------------------------------------------------------------------------------
