

import 'package:data_structures/binary_search_tree/binary_search_tree.dart';
import 'package:data_structures/linked_list/linked_list.dart';
import 'package:data_structures/stack/stack.dart';
import 'package:data_structures/queue/queue.dart';


class TreeModel extends BaseNodeBTS {
  TreeModel({required super.value, required this.productName});
  final String productName;

  @override
  String toString() {
    return 'TreeModel{productName: $productName, value: ${super.value}}';
  }
}

void main(List<String> arguments) {
  LinkedList<int> linkedList = LinkedList<int>();
  Stack<int> stack = Stack();
  Queue<int> queue = Queue();
  BTS<TreeModel> bts = BTS<TreeModel>();
  bts.insert(TreeModel(value: 20, productName: "first product"));
  bts.insert(TreeModel(value: 5, productName: "second product"));
  bts.insert(TreeModel(value: 7, productName: "third product"));
  bts.insert(TreeModel(value: 9, productName: "4 product"));
  bts.insert(TreeModel(value: 4, productName: "5 product"));
  bts.insert(TreeModel(value: 3, productName: "6 product"));
  bts.insert(TreeModel(value: 21, productName: "7 product"));
  bts.insert(TreeModel(value: 25, productName: "8 product"));
  bts.insert(TreeModel(value: 22, productName: "9 product"));
  bts.preorderTraversal();
  bool searchResult = bts.search(4);
  print("search result = $searchResult");
}