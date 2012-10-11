package bombir.brushes;

import processing.core.PApplet;
import processing.core.PGraphics;
import toxi.geom.Vec3D;
import gml4u.drawing.GmlStrokeDrawer;
import gml4u.model.GmlBrush;
import gml4u.model.GmlPoint;
import gml4u.model.GmlStroke;

/**
 * Eraser brush. Black brush for erasing things on a black background
 * 
 * @author Hauke Altmann
 *
 */
public class Eraser extends GmlStrokeDrawer{
	
	public static final String ID = "BOMBIR_STYLE_ERASER0000";
	
	public Eraser() {
		super(ID);
		is3D(false);
	}

	@Override
	public void draw(PGraphics g, GmlStroke stroke, float scale, float minTime,
			float maxTime) {
		GmlBrush brush = stroke.getBrush();
		g.stroke(0.0f,0.0f,0.0f);
		g.fill(0.0f,0.0f,0.0f);
		g.strokeWeight(brush.getFloat("size"));
		g.strokeJoin(PApplet.ROUND);
		for (GmlPoint point : stroke.getPoints()) {
			if (point.time < minTime) continue;
			if (point.time > maxTime) break;
			Vec3D v = point.scale(scale);
			g.ellipse(v.x, v.y, brush.getFloat("size"), brush.getFloat("size"));
		}
	}
}
