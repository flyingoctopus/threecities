 package projms.publisher;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import processing.core.*;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQTextMessage;

/**
 * Class to publish messages to a Message Broker
 * 
 * @author Hauke Altmann <hauke@grlg.org>
 *
 */
public class Publisher {
	protected PApplet parent;	
	protected transient Connection connection;
	protected transient Session session;
	protected transient MessageProducer producer;
	protected static transient ConnectionFactory factory;
	
	
	/**
	 * Constructor
	 * 
	 * @param the URI of the message broker to connect to
	 * @param parent the processing applet using the publisher
	 */
	public Publisher(String brokerURI, PApplet parent){
		this.parent = parent;
		parent.registerDispose(this);
		
		try{
	      factory = new ActiveMQConnectionFactory(brokerURI);
	      connection = factory.createConnection();
	      connection.start();
	      session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
	      producer = session.createProducer(null);
	    } catch(JMSException ex){
	        System.out.println("JMS Exception Setup" + ex.getMessage());
	    }
	  }
	  
	  public void close() throws JMSException {
	    if (connection != null) {
	      connection.close();
	    }
	  }
	  
	  /**
	   * Dispose the publisher
	   */
	  public void dispose(){
		  try {
			this.close();
		} catch (JMSException e) {
			e.printStackTrace();
		}
	  }
	  
	  /**
	   * Send message to topic queue
	   * 
	   * @param text the message text to send
	   * @param type the type of the message
	   * @param topic the topic queue to send the message to
	   */
	  public void sendMessage(String text, String type, String topic){
	    try{
	           Destination destination = session.createTopic(topic);
	           TextMessage message = session.createTextMessage();            
	           message.setStringProperty("TYPE", type);
	           message.setText(text);
	           //System.out.println("Sending: " + ((ActiveMQTextMessage)message).getText() + " on destination: " + destination);
	           producer.send(destination, message);
	         } catch(JMSException ex){
	           System.out.println("JMS Exception Publisher Setup");
	         }
	   }
}
