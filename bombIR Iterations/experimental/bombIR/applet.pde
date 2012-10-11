

//-----------------------------------------------------------------------------------------
// FRAME

public class PFrame extends Frame {
  PApplet s;  
  public PFrame(PApplet applet, int ScreenOffset, int ScreenWidth, int ScreenHeight) {
        setBounds(ScreenOffset, 0, ScreenWidth, ScreenHeight);
        s = applet;
        add(s);
        removeNotify(); 
        setUndecorated(false);   
        setResizable(false);
        addNotify(); 
        setLocation(320, 0);
        s.init();
        //show();
        setVisible(true);
    }
}

//-----------------------------------------
// INIT

public void init() {
  frame.removeNotify(); 
  frame.setUndecorated(false);   
  frame.setResizable(false);
  frame.addNotify(); 
  super.init();
}


//-----------------------------------------
// 2ND SCREEN

public class secondApplet extends PApplet {
  
    public void setup() {
      size(SecondScreenWidth, SecondScreenHeight);
      background(0);

    }
 
    synchronized public void draw() {
      if(s2 != null) {
        // Copy
        s2.beginDraw();
          s2.copy(pg, 0, 0, pg.width, pg.height, 0, 0, s2.width, s2.height);
        s2.endDraw();
        image(s2, 0, 0);
      }
    }
}



