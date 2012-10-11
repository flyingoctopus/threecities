/**
 * 
 */
package projms.util;

/**
 * @author Hauke Altmann <hauke@grlg.org>
 * 
 * Simple representation of a typed Text message
 *
 */
public class TypedMessage {
	private String type;
	private String text;
	
	
	public TypedMessage(String type, String text){
		this.type = type;
		this.text = text;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
}
