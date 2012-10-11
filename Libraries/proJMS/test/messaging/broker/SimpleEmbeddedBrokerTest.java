/**
 * 
 */
package messaging.broker;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import projms.broker.SimpleEmbeddedBroker;

/**
 * @author haukepauke
 *
 */
public class SimpleEmbeddedBrokerTest {
	
	SimpleEmbeddedBroker cut;

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
		cut.shutdown();
	}

	@Test
	public void startTest() {
		cut = new SimpleEmbeddedBroker("c:/tmp/");
	}

}
