
/**
 *  Send stroke message
 */
void sendStrokeMessage(String gml){
  messagePublisher.sendMessage(gml,"STROKE", "TCP.BERLIN");
}

/**
 *  Send message to clear screen
 */
void sendClearScreenMessage(){
 messagePublisher.sendMessage("","CLEAR", "TCP.BERLIN");
}
