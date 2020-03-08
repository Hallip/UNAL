
public class Node<O> {

	private Node<O> previous;
	private O key;
	private Node<O> next;

	public Node(Node<O> previous, O key, Node<O> next) {
		super();
		this.previous = previous;
		this.key = key;
		this.next = next;
	}

	public Node<O> getPrevious() {
		return previous;
	}

	public void setPrevious(Node<O> previous) {
		this.previous = previous;
	}

	public O getKey() {
		return key;
	}

	public void setKey(O key) {
		this.key = key;
	}

	public Node<O> getNext() {
		return next;
	}

	public void setNext(Node<O> next) {
		this.next = next;
	}

	@Override
	public String toString() {
		return this.key + (this.next == null ? "" : ", ");
	}

}
