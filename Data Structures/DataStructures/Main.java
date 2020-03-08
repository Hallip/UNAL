
public class Main {

	public static void main(String[] args) {
		DoublyLinkedList<Integer> list = new DoublyLinkedList<>();
		for (int i = 0; i < 10; i++) {
			list.pushFront(i);
			System.out.println(list);
		}
		System.out.println(list.topFront());
		for (int i = 0; i < 10; i++) {
			list.popFront();
			System.out.println(list);
		}

		System.out.println("=================================");

		for (int i = 0; i < 10; i++) {
			list.pushBack(i);
			System.out.println(list);
		}
		System.out.println(list.topBack());
		for (int i = 0; i < 10; i++) {
			list.popBack();
			System.out.println(list);
		}

	}

}
