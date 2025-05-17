void printInReverse<T>(Node<T>? node) {
    if (node == null) return;
    printInReverse(node.next);
    print(node.value);
}