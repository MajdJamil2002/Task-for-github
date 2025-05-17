class Node<T> {
    T value;
    Node<T>? next;

    Node(this.value);
    }

    class LinkedList<T> {
    Node<T>? head;

    void add(T value) {
        final newNode = Node(value);
        if (head == null) {
        head = newNode;
        } else {
        var current = head;
        while (current!.next != null) {
            current = current.next;
        }
        current.next = newNode;
        }
    }

    void printList() {
        var current = head;
        while (current != null) {
        print(current.value);
        current = current.next;
        }
    }
}