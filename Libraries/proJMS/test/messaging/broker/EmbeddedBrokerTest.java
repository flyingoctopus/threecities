package messaging.broker;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import projms.broker.EmbeddedBroker;

public class EmbeddedBrokerTest {
	
	EmbeddedBroker cut;

	@Before
	public void setUp() throws Exception {
		cut = new EmbeddedBroker();
		cut.setDataDirectory("C:/tmp/");
	}

	@After
	public void tearDown() throws Exception {
		cut.shutdown();
	}

	@Test
	public void testAddConnector() {
		try{
			cut.addConnector("tcp://localhost:61616");
			cut.start();
		}catch(Exception ex){
			fail("Starting broker failed");
		}
	}
	
	//@Test
	public void testStartTwoBroker(){
		EmbeddedBroker cut2 = new EmbeddedBroker();
		cut2.setDataDirectory("c:/tmp/test2/");
		try{
			cut.addConnector("tcp://localhost:61616");
			cut2.addConnector("tcp://localhost:61616");
			fail("Starting two brokers not allowed");
			
		}catch(Exception ex){
			System.out.println("Exception catched: " + ex.getMessage());
			cut2.shutdown();
		}
	}
	
	@Test
	public void testStartTwoBrokersDifferentPorts(){
		EmbeddedBroker cut2 = new EmbeddedBroker();
		cut2.setDataDirectory("c:/tmp/test2/");
		try{
			cut.addConnector("tcp://localhost:61616");
			cut2.addConnector("tcp://localhost:61618");
			cut.start();
			cut2.start();
			
		}catch(Exception ex){
			System.out.println("Exception catched: " + ex.getMessage());
			fail("Starting two brokers failed");
		}
		cut2.shutdown();
	}

}
