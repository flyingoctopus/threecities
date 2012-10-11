import org.apache.log4j.PropertyConfigurator;
import controlP5.*;

import oscP5.*;
import netP5.*;

import processing.opengl.*;
import codeanticode.glgraphics.*;

import gml4u.brushes.*;
import gml4u.drawing.*;
import gml4u.utils.GmlParsingHelper;
import gml4u.utils.Timer;
import gml4u.model.*;
import toxi.geom.Vec3D;
import java.util.UUID;
import projms.consumer.Consumer;
import gml4u.model.GmlBrush;
import bombir.brushes.*;

Consumer messageConsumer;
Gml gml;
GmlBrushManager brushManager = new GmlBrushManager(this);
Timer timer;
GmlBrush brush;
PGraphics pg;
int FirstScreenWidth;
int FirstScreenHeight;
float scale;


void setup() {
  PropertyConfigurator.configure(sketchPath+"/log4j.properties");
  FirstScreenWidth   =  640;
  FirstScreenHeight  =  480;
  size(FirstScreenWidth, FirstScreenHeight, JAVA2D);
  background(0);
  smooth();
  frame.setLocation(0,0);
  pg  = createGraphics(FirstScreenWidth,  FirstScreenHeight, JAVA2D);
  
  Vec3D screen = new Vec3D(width, height, 0);
  scale = FirstScreenWidth;
  
  //For usage inside a network in peer to peer mode
  messageConsumer = new Consumer(this, "peer://group1/" + UUID.randomUUID().toString(), "TCP.BERLIN");
  //For statically connecting with a broker
  //messageConsumer = new Consumer(this, "tcp://lvps83-169-42-62.dedicated.hosteurope.de:61616", "TCP.BERLIN");
  
  //add bombir brushes to the brushmanager
  brushManager.add(new FwdSlash());
  brushManager.add(new Circle());
  brushManager.add(new SimpleLine());
  brushManager.add(new FatCap());
  brushManager.add(new GhettoPaint());
  brush = new GmlBrush();
  
  timer = new Timer();
  timer.setStep(0.01f);
}

void draw() {
  if(gml != null){
    timer.tick();
    pg.beginDraw();
    pg.smooth();
    brushManager.draw(pg, gml, scale, timer.getTime(), timer.getTime()+0.1f);
    pg.endDraw();
    image(pg,0,0);
  }
}

//message is called by the Consumer object when message arrives
void onMessageArrival(String messageText, String messageType){
	System.out.println("Message: " + messageText); 
	System.out.println("MessageType: " + messageType); 
	if(messageType.equals("CLEAR")){
		pg.background(0);
        gml = null;
	}else{
	  	gml = GmlParsingHelper.getGmlFromString(messageText, false);
        List<GmlStroke> strokes = (List<GmlStroke>)gml.getStrokes();
        if(strokes.size() < 1){
        	return;
        }     
        timer.start();
	}
}
