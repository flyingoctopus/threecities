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
public class MessageTextQueue<TypedMessage> {
	
	private LinkedList<TypedMessage> list = new LinkedList<TypedMessage>();

	/**
	* Puts TypedMessage in queue.
	*/
	public void put(TypedMessage o) {
	 list.addLast(o);
	}

	/**
	* Returns an TypedMessage from queue.
	*
	* @return TypedMessage from queue or <code>null</code> if queue is empty
	*/
	public TypedMessage get() {
	 if (list.isEmpty()) {
	   return null;
	 }
	 return list.removeFirst();
	}

	/**
	* Returns all TypedMessage from the queue and clears it.
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
	* Peeks an TypedMessage in the queue. Returned elements is not removed from the queue.
	*/
	public TypedMessage peek() {
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





