import 'package:data_structures/common/common.dart';

class Stack<T> {
  Node<T>? _first;
  Node<T>? _last;
  int _length = 0;

  int get length => _length;

  T? get first => _first?.value;

  T? get last => _last?.value;

  bool get isEmpty => _first == null;

  bool get isNotEmpty => !isEmpty;

  void push(T item) {
    if (_first != null) {
      Node<T> newNode = Node<T>(item, _first);
      _first = newNode;
    } else {
      Node<T> newNode = Node<T>(item, null);
      _first = newNode;
    }
    _length++;
  }

  T pop() {
    if (isEmpty) {
      throw "the stack is empty";
    } else if (_length == 1) {
      T val = _first!.value;
      _first = null;
      _length--;
      return val;
    } else {
      Node<T>? temp = _first;
      T val = temp!.value;
      _first = temp.next;
      _length--;
      return val;
    }
  }

  void printAll() {
    Node<T>? temp = _first;
    while (temp != null) {
      print(temp.value.toString());
      temp = temp.next;
    }
  }

  List<T> toList() {
    List<T> list = <T>[];
    Node<T>? temp = _first;
    while (temp != null) {
      list.add(temp.value);
      temp = temp.next;
    }
    return list;
  }

  bool isIncluded(T item) {
    Node<T>? temp = _first;
    while (temp != null) {
      if (temp.value == item) {
        return true;
      }
      temp = temp.next;
    }
    return false;
  }
}
