package projms.consumer;

import processing.core.*;
import java.lang.reflect.Method;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.Session;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQTextMessage;

/**
 * Class to consume messages received by a message broker
 * 
 * @author Hauke Altmann (hauke@grlg.org)
 */
public class Consumer {
	private transient Connection connection;
    private transient Session session;
    protected static transient ConnectionFactory factory;
    Method onMessageArrival;
    PApplet parent;
    
    /**
     * Constructor 
     * 
     * @param parent the processing applet using the consumer
     * @param brokerURI the URI the consumer should use
     * @param topic the topic the consumer should subscribe to
     */
    public Consumer(PApplet parent, String brokerURI, String topic) {
    	this.parent = parent;
    	try{
    	  Class[] parameterTypes = new Class[]{ String.class, String.class }; 
    	  onMessageArrival = parent.getClass().getMethod("onMessageArrival",  parameterTypes);
	
          factory = new ActiveMQConnectionFactory(brokerURI);
      	  connection = factory.createConnection();
          connection.start();
          session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
          Destination destination = this.getSession().createTopic(topic);
      	  MessageConsumer messageConsumer = this.getSession().createConsumer(destination);
      	  
      	  Listener listener = new Listener();
      	  messageConsumer.setMessageListener(listener);
        }catch(JMSException ex){
          System.out.println(ex.getMessage());
        } catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public void close() throws JMSException {
        if (connection != null) {
            connection.close();
        }
    }    
    
    public Session getSession() {
    	return session;
    }
    
    public void onMessageArrival(String messageText, String messageType){
    	if (onMessageArrival != null) {
    	    try {
    	      onMessageArrival.invoke(parent, messageText, messageType);
    	    } catch (Exception e) {
    	      System.err.println("Disabling onMessage() for Consumer because of an error.");
    	      e.printStackTrace();
    	      onMessageArrival = null;
    	    }
    	}

    }
    
    class Listener implements MessageListener {
        //do this when a message arrives
    	public void onMessage(Message message) {
    		try {
    	         onMessageArrival(((ActiveMQTextMessage)message).getText(), ((ActiveMQTextMessage)message).getStringProperty("TYPE"));
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    	}
    }
}


