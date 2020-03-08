
public class LinkedListBasedQueue<E> implements Queue<E> {

	private DoublyLinkedList<E> list = new DoublyLinkedList<>();

	@Override
	public void enqueue(E key) {
		this.list.pushBack(key);
	}

	@Override
	public E dequeue() {
		return this.list.popFront();
	}

	@Override
	public boolean isEmpty() {
		return this.list.isEmpty();
	}

	@Override
	public String toString() {
		return this.list.toString();
	}

	public static void main(String[] args) {
		Queue<Character> queue = new LinkedListBasedQueue<>();
		for (int i = 0; i < 10; i++) {
			queue.enqueue((char) (i + 97));
			System.out.println(queue);
		}
		for (int i = 0; i < 10; i++) {
			queue.dequeue();
			System.out.println(queue);
		}
	}

}
