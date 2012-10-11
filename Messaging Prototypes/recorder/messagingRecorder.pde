import org.apache.log4j.PropertyConfigurator;

import gml4u.brushes.CurvesDemo;
import gml4u.events.GmlParsingEvent;
import gml4u.drawing.GmlBrushManager;
import gml4u.events.GmlEvent;
import gml4u.model.GmlBrush;
import gml4u.model.GmlConstants;
import gml4u.model.GmlStroke;
import gml4u.model.Gml;
import gml4u.recording.GmlRecorder;
import gml4u.utils.GmlSaver;
import gml4u.utils.GmlSavingHelper;
import gml4u.utils.Timer;
import toxi.geom.Vec3D;
import projms.publisher.Publisher;
import java.util.UUID;

Timer timer = new Timer();
Publisher messagePublisher;

float scale;
GmlRecorder recorder;
GmlSaver saver;
GmlBrushManager brushManager;


void setup() {
  size(600, 400, P3D);
  PropertyConfigurator.configure(sketchPath+"/log4j.properties");

  // The recording area
  Vec3D screen = new Vec3D(width, height, 100);
  
  // Recorder
  recorder = new GmlRecorder(screen, 0.015f, 0.01f);
  
  // BrushManager: used to draw
  brushManager = new GmlBrushManager(this);
  // Scale: used to scale back the Gml points to their original size
  scale = width;

  // GmlSaver to save a Gml
  saver = new GmlSaver(500, "", this);
  saver.start();
  
  //Initialize the publisher
  //For usage inside a network in peer to peer mode
  //messagePublisher = new Publisher("peer://group1/" + UUID.randomUUID().toString(), this);
  
  //For statically connecting with a broker
  messagePublisher = new Publisher("tcp://lvps83-169-42-62.dedicated.hosteurope.de:61616", this);
  background(255);
}

void draw() {
  // Here, we use the strokes handled by the recorder rather than
  // the Gml returned by the recorder because we also want the strokes
  // being drawn
  for (GmlStroke stroke : recorder.getStrokes()) { 
	brushManager.draw(stroke, scale);
  }

}

// Callback method
void gmlEvent(GmlEvent event) {
  // Check if the event was sent by the parser 
  if (event instanceof GmlParsingEvent) {
    // If so, get the Gml
    Gml gml = ((GmlParsingEvent) event).gml;
    recorder.setGml(gml);
  }
}


void keyPressed() {
  //clear screen when pressing d
  if (key == 'd') {
    background(255);
    recorder.clear();
    sendClearScreenMessage();
  }
}


// Called when mouse buttons are pressed
void mousePressed() {
    // Start recording if not already
    GmlBrush brush = new GmlBrush();
    brush.set(GmlBrush.UNIQUE_STYLE_ID, CurvesDemo.ID);
    timer.start();
    recorder.beginStroke(0, 0, brush);
}


// Called when mouse is moved with button pressed
void mouseDragged() {
    // Get pointer coords as a xyz Vector between 0,0,0 and 1,1,1
    Vec3D v = new Vec3D((float) mouseX/width, (float) mouseY/height, frameCount/3000);
    timer.tick();
    recorder.addPoint(0, v, timer.getTime());
}

// Called when mouse buttons are released
void mouseReleased() {
    recorder.endStroke(0);
    String gmlxml = GmlSavingHelper.getGMLXML(recorder.getGml());
    sendStrokeMessage(gmlxml);
    //clear recorder, so the current stroke is only send once
    recorder.clear();
    timer.reset();
}
