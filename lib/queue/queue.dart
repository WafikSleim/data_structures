

import 'package:data_structures/common/common.dart';

class Queue<T> {
  Node<T>? _first;
  Node<T>? _last;
  int _length = 0;

  int get length => _length;

  T? get first => _first?.value;

  T? get last => _last?.value;

  bool get isEmpty => _first == null;

  bool get isNotEmpty => !isEmpty;


  void enqueue(T item) {
    Node<T> newItem = Node(item, null);
    if (_first == null) {
      _first = newItem;
      _last = newItem;
    } else {
      _last!.next = newItem;
      _last = newItem;
    }
    _length++;
  }

  T dequeue() {
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