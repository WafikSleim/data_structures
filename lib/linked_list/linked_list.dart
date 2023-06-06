import 'package:untitled/common/common.dart';

class LinkedList<T> {
  Node<T>? _first;
  Node<T>? _last;
  int _length = 0;

  int get length => _length;

  T? get first => _first?.value;

  T? get last => _last?.value;

  bool get isEmpty => _first == null;

  bool get isNotEmpty => !isEmpty;

  void addItem(T item) {
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

  void printAll() {
    Node<T>? temp = _first;
    while (temp != null) {
      print(temp.value.toString());
      temp = temp.next;
    }
  }

  void addFirst(T item) {
    if (_first != null) {
      Node<T> newNode = Node<T>(item, _first);
      _first = newNode;
    } else {
      Node<T> newNode = Node<T>(item, null);
      _first = newNode;
    }
    _length++;
  }

  void removeWhere(bool Function(T item) where) {
    Node<T>? temp = _first;
    if (temp != null) {
      if(where.call(temp.value)) {
        temp = temp.next;
      } else {
        while (temp?.next != null) {
          if(where.call(temp!.next!.value)) {
            break;
          }
          temp = temp.next;
        }
        temp?.next = temp.next?.next;
      }
    } else {
      throw "this linked list is empty";
    }
  }

  void insertBefore(T item, T newItem) {
    if (_first == null) {
      throw "the linked list is empty";
    } else if (!isIncluded(item)) {
      throw "item not found";
    } else if (item == _first!.value) {
      addFirst(newItem);
    } else {
      Node<T>? temp = _first!;
      Node<T> newNode = Node<T>(newItem, null);
      while (temp?.next != null) {
        if (temp!.next?.value == item) {
          break;
        }
        temp = temp.next;
      }
      newNode.next = temp?.next;
      temp?.next = newNode;
      _length++;
    }
  }

  void insertAfter(T item, T newItem) {
    if (_first == null) {
      throw "the linked list is empty";
    } else if (!isIncluded(item)) {
      throw "item not found";
    } else if (item == _last!.value) {
      addItem(newItem);
    } else {
      Node<T>? temp = _first!;
      Node<T> newNode = Node<T>(newItem, null);
      while (temp != null) {
        if (temp.value == item) {
          break;
        }
        temp = temp.next;
      }
      newNode.next = temp?.next;
      temp?.next = newNode;
      _length++;
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