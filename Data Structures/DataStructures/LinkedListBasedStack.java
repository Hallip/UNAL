
public class LinkedListBasedStack<E> extends DoublyLinkedList<E> implements Stack<E> {

	@Override
	public void push(E key) {
		pushBack(key);
	}

	@Override
	public E top() {
		return topBack();
	}

	@Override
	public E pop() {
		return popBack();
	}

	public static void main(String[] args) {
		Stack<Character> stack = new LinkedListBasedStack<>();
		for (int i = 0; i < 10; i++) {
			stack.push((char) (i + 65));
			System.out.println(stack);
		}
		System.out.println(stack.top());
		for (int i = 0; i < 10; i++) {
			stack.pop();
			System.out.println(stack);
		}
	}

}
