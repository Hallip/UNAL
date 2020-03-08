import java.util.NoSuchElementException;

public class ArrayBasedStack<E> implements Stack<E> {

	private E[] array;
	private int size;

	@SuppressWarnings("unchecked")
	public ArrayBasedStack() {
		this.array = (E[]) new Object[1];
	}

	// O(1)
	@Override
	public void push(E key) {
		if (this.size >= this.array.length) {
			@SuppressWarnings("unchecked")
			E[] newArray = (E[]) new Object[this.array.length * 2];
			System.arraycopy(this.array, 0, newArray, 0, this.array.length);
			this.array = newArray;
		}

		this.array[size++] = key;
	}

	// O(1)
	@Override
	public E top() {
		if (isEmpty()) {
			throw new NoSuchElementException("La lista está vacia");
		}

		return this.array[this.size - 1];
	}

	// O(1)
	@Override
	public E pop() {
		return this.array[--this.size];
	}

	// O(1)
	@Override
	public boolean isEmpty() {
		return this.size == 0;
	}

	// O(n)
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < this.size; i++) {
			sb.append(", ").append(this.array[i]);
		}
		String string = sb.append("]").toString();
		return "[" + (string.length() > 2 ? string.substring(2) : string);
	}

	public static void main(String[] args) {
		Stack<Character> stack = new ArrayBasedStack<>();
		for (int i = 0; i < 10; i++) {
			stack.push((char) (i + 65));
			System.out.println(stack);
		}
		System.out.println(stack.top());
		for (int i = 0; i < 10; i++) {
			stack.pop();
			System.out.println(stack);
		}
		System.out.println(stack.top());
	}

}
