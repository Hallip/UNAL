
public interface Queue<E> {

	void enqueue(E key);

	E dequeue();

	boolean isEmpty();

}
