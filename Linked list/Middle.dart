Node<T>? findMiddle<T>(Node<T>? head) {
    Node<T>? slow = head;
    Node<T>? fast = head;

    while (fast != null && fast.next != null) {
        slow = slow!.next;
        fast = fast.next!.next;
    }

    return slow;
}