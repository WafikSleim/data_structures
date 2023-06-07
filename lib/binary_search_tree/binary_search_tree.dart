abstract class BaseNodeBTS {
  int value;

  BaseNodeBTS({required this.value});

  @override
  String toString() {
    return 'BaseNodeBTS{value: $value}';
  }
}

class Node<T extends BaseNodeBTS> {
  T value;
  Node<T>? left;
  Node<T>? right;

  Node(this.value, {this.left, this.right});

  @override
  String toString() {
    return 'Node{value: $value, left: $left, right: $right}';
  }
}

class BTS<T extends BaseNodeBTS> {
  Node<T>? _root;

  int? get root => _root?.value.value;

  bool get isEmpty => _root == null;

  bool get isNotEmpty => !isEmpty;

  Node<T>? _insert(T item, {Node<T>? bTSRoot}) {
    Node<T> newNode = Node<T>(item);
    if (bTSRoot == null) {
      bTSRoot = newNode;
    } else if (item.value < bTSRoot.value.value) {
      bTSRoot.left = _insert(item, bTSRoot: bTSRoot.left);
    } else if (item.value > bTSRoot.value.value) {
      bTSRoot.right = _insert(item, bTSRoot: bTSRoot.right);
    }
    // print("btsRoot insert${bTSRoot.toString()}");
    return bTSRoot;
  }

  void insert(T item) {
    _root = _insert(item, bTSRoot: _root);
  }

  bool _search(int id, {Node<T>? bTSRoot}) {
    if (bTSRoot != null) {
      if (bTSRoot.value.value == id) {
        return true;
      } else if (id < bTSRoot.value.value) {
        return _search(id, bTSRoot: bTSRoot.left);
      } else {
        return _search(id, bTSRoot: bTSRoot.right);
      }
    } else {
      return false;
    }
  }

  bool search(int item) {
    return _search(item, bTSRoot: _root);
  }

  void _preorderTraversal(Node<T> bTSRoot) {
    print(bTSRoot.value.toString());
    if(bTSRoot.left != null) {
      _preorderTraversal(bTSRoot.left!);
    }
    if (bTSRoot.right != null) {
      _preorderTraversal(bTSRoot.right!);
    }
  }

  void preorderTraversal() {
    if (isNotEmpty) {
      _preorderTraversal(_root!);
    }
  }

  void _inorderTraversal(Node<T> bTSRoot) {
    if(bTSRoot.left != null) {
      _inorderTraversal(bTSRoot.left!);
    }
    print(bTSRoot.value.toString());
    if (bTSRoot.right != null) {
      _inorderTraversal(bTSRoot.right!);
    }
  }

  void inorderTraversal() {
    if (isNotEmpty) {
      _inorderTraversal(_root!);
    }
  }

  void _postorderTraversal(Node<T> bTSRoot) {
    if(bTSRoot.left != null) {
      _postorderTraversal(bTSRoot.left!);
    }
    if (bTSRoot.right != null) {
      _postorderTraversal(bTSRoot.right!);
    }
    print(bTSRoot.value.toString());
  }

  void postorderTraversal() {
    if (isNotEmpty) {
      _postorderTraversal(_root!);
    }
  }
}
