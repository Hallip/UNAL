
public class DoublyLinkedList<E> {

	private Node<E> head;
	private Node<E> tail;

	public Node<E> getHead() {
		return head;
	}

	public void setHead(Node<E> head) {
		this.head = head;
	}

	public Node<E> getTail() {
		return tail;
	}

	public void setTail(Node<E> tail) {
		this.tail = tail;
	}

	public boolean isEmpty() {
		return this.head == null;
	}

	// pushFront: O(1)
	public void pushFront(E key) {
		if (isEmpty()) {
			this.head = this.tail = new Node<E>(null, key, null);
		} else {
			this.head = new Node<E>(null, key, this.head);
			this.head.getNext().setPrevious(this.head);
		}
	}

	// topFront: O(1)
	public E topFront() {
		if (isEmpty()) {
			throw new RuntimeException("La lista está vacia");
		}

		return this.head.getKey();
	}

	// popFront: O(1)
	public E popFront() {
		if (isEmpty()) {
			throw new RuntimeException("La lista está vacia");
		}

		E key = this.head.getKey();
		if (this.head == this.tail) {
			this.head = this.tail = null;
		} else {
			this.head = this.head.getNext();
			this.head.setPrevious(null);
		}
		return key;
	}

	// pushBack: O(1)
	public void pushBack(E key) {
		Node<E> node = new Node<E>(null, key, null);
		if (isEmpty()) {
			this.head = this.tail = node;
		} else {
			this.tail.setNext(node);
			node.setPrevious(this.tail);
			this.tail = node;
		}
	}

	// topBack: O(1)
	public E topBack() {
		if (isEmpty()) {
			throw new RuntimeException("La lista está vacia");
		}

		return this.tail.getKey();
	}

	// popBack: O(1)
	public E popBack() {
		if (isEmpty()) {
			throw new RuntimeException("La lista está vacia");
		}

		E key = this.tail.getKey();
		if (this.head == this.tail) {
			this.head = this.tail = null;
		} else {
			this.tail = this.tail.getPrevious();
			this.tail.setNext(null);
		}
		return key;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder("[");

		Node<E> current = this.head;
		while (current != null) {
			sb.append(current);
			current = current.getNext();
		}

		return sb.append("]").toString();
	}

}
