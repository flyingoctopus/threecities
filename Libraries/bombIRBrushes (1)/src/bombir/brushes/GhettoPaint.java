/**
 * 
 */
package bombir.brushes;

import java.util.Random;

import bombir.brushes.utils.PRandom;

import processing.core.PApplet;
import processing.core.PGraphics;
import toxi.geom.Vec3D;
import gml4u.drawing.GmlStrokeDrawer;
import gml4u.model.GmlBrush;
import gml4u.model.GmlPoint;
import gml4u.model.GmlStroke;

/**
 * @author haukepauke
 *
 */
public class GhettoPaint extends GmlStrokeDrawer {
	
	public static final String ID = "BOMBIR_STYLE_GHETTOPAINT0000";
	PRandom prandom;
	
	public GhettoPaint() {
		super(ID);
		is3D(true);
		prandom = new PRandom();
	}

	/* (non-Javadoc)
	 * @see gml4u.drawing.GmlStrokeDrawer#draw(processing.core.PGraphics, gml4u.model.GmlStroke, float, float, float)
	 */
	@Override
	public void draw(PGraphics g, GmlStroke stroke, float scale, float minTime,
			float maxTime) {
		GmlBrush brush = stroke.getBrush();
		g.stroke(brush.getFloat("red"),brush.getFloat("green"),brush.getFloat("blue"),brush.getFloat("alpha"));
		g.fill(brush.getFloat("red"),brush.getFloat("green"),brush.getFloat("blue"),brush.getFloat("alpha"));
		g.strokeWeight(brush.getFloat("size"));
		g.strokeJoin(PApplet.ROUND);
		Random rand = new Random((long)(Float.parseFloat((brush.getFloat("randomseed").toString()))));
		for (GmlPoint point : stroke.getPoints()) {
			if (point.time < minTime) continue;
			if (point.time > maxTime) break;
			Vec3D v = point.scale(scale);
			for(int i = 0; i < 15; i++) {
		          float theta = prandom.random(0, 4 * PApplet.PI);
		          int radius = (int)prandom.random(0, 30);
		          int x = (int)(v.x) + (int)(PApplet.cos(theta)*radius);
		          int y = (int)(v.y) + (int)(PApplet.sin(theta)*radius);
		          //g.ellipse(x,y,0.5f,0.5f);
		          g.point(x,y);
		    }
		}

	}

}
