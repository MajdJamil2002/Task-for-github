void reverseList<T>(List<T> list) {
    final stack = <T>[];

    for (final item in list) {
        stack.add(item);
    }

    while (stack.isNotEmpty) {
        final item = stack.removeLast();
        print(item);
    }
}

void main() {
    final myList = [1, 2, 3, 4, 5];
    reverseList(myList);
}