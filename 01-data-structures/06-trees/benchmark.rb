require 'benchmark'
require_relative 'binary_heap/binary_heap.rb'
require_relative 'binary_tree/binary_search_tree.rb'
require_relative 'binary_tree/node.rb'

base_node = Node.new("1", 1)
bst = BinarySearchTree.new(base_node)
mbh = BinaryHeap.new(base_node)

Benchmark.bm do |x|
  x.report("Binary Search Tree:   ") { n = 1; 10_000.times do; node = Node.new("#{n}", n); n += 1; bst.insert(base_node, node); end }
  x.report("Min Binary Heap:      ") { n = 1; 10_000.times do; node = Node.new("#{n}", n); n += 1; mbh.insert(node); end }
  x.report("Binary Search Tree:   ") { bst.find(base_node, "5000") }
  x.report("Min Binary Heap:      ") { mbh.find("5000") }
  x.report("Binary Search Tree:   ") { bst.delete(base_node, "5000") }
  x.report("Min Binary Heap:      ") { mbh.delete("5000") }
  x.report("Binary Search Tree:   ") { bst.printf }
  x.report("Min Binary Heap:      ") { mbh.print }
end
