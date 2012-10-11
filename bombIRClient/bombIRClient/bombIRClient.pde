


//-----------------------------------------------------------------------------------------
/*
 * bombIRClient
 * ---------------------------------------------------------------------------
 * Graffiti Research Lab Germany      |   Graffiti Research Lab Canada
 * www.graffitiresearchlab.de         |   www.graffitiresearchlab.ca
 * ----------------------------------------------------------------------------
 * License:
 * Licensed according to the 
 * Attribution-Non-Commercial-Repurcussions 3.0 Unported (CC BY-NC 3.0)
 * as per 
 * http://www.graffitiresearchlab.fr/?portfolio=attribution-noncommercial-repercussions-3-0-unported-cc-by-nc-3-0
 * 
 * ----------------------------------------------------------------------------
 * Credits
 * _______
 * 
 * Programming:  Jesse Scott + Hauke Alltman
 * 
 * Libraries:
 *  GML4U
 *  ToxiLibs
 *  Fullscreen
 *  proJMS
 *
 * ----------------------------------------------------------------------------
 */
//-----------------------------------------------------------------------------------------

// IMPORTS
//-----------------------------------------------------------------------------------------

import oscP5.*;
import netP5.*;

import gml4u.brushes.*;
import gml4u.drawing.GmlBrushManager;
import gml4u.drawing.GmlDrawingManager;
import gml4u.events.GmlEvent;
import gml4u.events.GmlParsingEvent;
import gml4u.events.GmlStrokeEndEvent;
import gml4u.model.GmlBrush;
import gml4u.model.GmlConstants;
import gml4u.model.GmlStroke;
import gml4u.model.Gml;
import gml4u.recording.GmlRecorder;
import gml4u.utils.GmlParser;
import gml4u.utils.GmlParsingHelper;
import gml4u.utils.Timer;
import gml4u.utils.GmlSaver;

import toxi.geom.Vec3D;

import java.util.Properties;

import fullscreen.*;

import javax.jms.*;
import java.util.UUID;
import gml4u.utils.GmlSavingHelper;
import gml4u.utils.Timer;
import projms.publisher.Publisher;
import projms.consumer.Consumer;
import projms.util.SimpleQueue;

import bombir.brushes.*;
  
// DECLARATIONS
//-----------------------------------------------------------------------------------------  

//Windows
SoftFullScreen fs; 

//Settings
P5Properties properties;

// GLOBAL VARIABLES
//-----------------------------------------------------------------------------------------

PImage logo, license;

Consumer messageConsumer;
GmlBrushManager bm;
GmlDrawingManager dm;
GmlBrush br;
Gml currentGml;
Timer ctime;
SimpleQueue<Gml> gmlQ;
PGraphics pg;

String brokerLocation, brokerTopic;
float sc;
int screenWidth;
int screenHeight;
int pm, py;

//-----------------------------------------------------------------------------------------
  
  void setup() {
   try {
      //reading settings.properties file
      properties=new P5Properties();
      properties.load(openStream("settings.properties"));
            
      screenWidth = properties.getIntProperty("env.view.screen.width",640);
      screenHeight = properties.getIntProperty("env.view.screen.height",480);
      brokerLocation = properties.getProperty("remote.broker.uri", "peer://group1/" + UUID.randomUUID().toString());
      brokerTopic = properties.getProperty("remote.broker.topic", "TCP.BERLIN");
    }
    catch(IOException e) {
      println("couldn't read config file...");
      exit();
    }
    
   messageConsumer = new Consumer(this, brokerLocation, brokerTopic, "test");
     
   size(screenWidth, screenHeight);
   background(0);
   smooth();
   sc = screenWidth;
   pg = createGraphics(screenWidth, screenHeight,   JAVA2D); 
   bm = new GmlBrushManager(this);
   dm = new GmlDrawingManager(this);
   gmlQ = new SimpleQueue<Gml>();
     
   bm.add(new FwdSlash());
   bm.add(new Circle());
   bm.add(new SimpleLine());
   bm.add(new FatCap());
   bm.add(new GhettoPaint());
   bm.add(new Eraser());
   br = new GmlBrush();
      
   ctime = new Timer();
   ctime.setStep(0.01f);
 }
 
void draw() {
   if(pg != null) {
       pg.beginDraw();
         pg.smooth();
         if (currentGml != null) {
           ctime.tick();
           bm.draw(pg, currentGml, sc, ctime.getTime(), ctime.getTime()+0.1f);
           dm.pulse(ctime.getTime());  
         }
       pg.endDraw();
       image(pg,0,0);
   }
 }
    
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

