/**
 * 
 */
package projms.util;

import java.util.LinkedList;

/**
 * @author Hauke Altmann <hauke@grlg.og>
 * 
 * based on Simple Queue by Jodd Team (jodd.org). 
 *
 */
public class MessageQueue<ActiveMQMessage> {
	
	private LinkedList<ActiveMQMessage> list = new LinkedList<ActiveMQMessage>();

	/**
	* Puts ActiveMQMessage in queue.
	*/
	public void put(ActiveMQMessage o) {
	 list.addLast(o);
	}

	/**
	* Returns an ActiveMQMessage from queue.
	*
	* @return ActiveMQMessage from queue or <code>null</code> if queue is empty
	*/
	public ActiveMQMessage get() {
	 if (list.isEmpty()) {
	   return null;
	 }
	 return list.removeFirst();
	}

	/**
	* Returns all ActiveMQMessages from the queue and clears it.
	*/
	public Object[] getAll() {
	 Object[] res = new Object[list.size()];
	 for (int i = 0; i < res.length; i++) {
	   res[i] = list.get(i);
	 }
	 list.clear();
	 return res;
	}


	/**
	* Peeks an ActiveMQMessage in the queue. Returned elements is not removed from the queue.
	*/
	public ActiveMQMessage peek() {
	 return list.getFirst();
	}

	/**
	* Returns <code>true</code> if queue is empty, otherwise <code>false</code>
	*/
	public boolean isEmpty() {
	 return list.isEmpty();
	}

	/**
	* Returns queue size.
	*/
	public int size() {
	 return list.size();
	}

}





