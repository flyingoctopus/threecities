/**
 * 
 */
package bombir.brushes;

import processing.core.PApplet;
import processing.core.PGraphics;
import toxi.geom.Vec3D;
import gml4u.drawing.GmlStrokeDrawer;
import gml4u.model.GmlBrush;
import gml4u.model.GmlPoint;
import gml4u.model.GmlStroke;

/**
 * SIMPLE LINE
 * 
 * @author haukepauke
 *
 */
public class SimpleLine extends GmlStrokeDrawer {
	
	public static final String ID = "BOMBIR_STYLE_SIMPLELINE0000";
	
	public SimpleLine(){
		super(ID);
		is3D(true);
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
		Vec3D previousPoint = new Vec3D();
		boolean firstPoint = true;
		for (GmlPoint point : stroke.getPoints()) {
			if (point.time < minTime) continue;
			if (point.time > maxTime) break;
			Vec3D v = point.scale(scale);
			if(firstPoint){
				g.line(v.x, v.y, v.x, v.y);
				firstPoint = false;
			}else{
				g.line(v.x, v.y, previousPoint.x, previousPoint.y);
			}
			previousPoint = v;
		}

	}

}
