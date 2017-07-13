require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

arr = []
ll = LinkedList.new()
ll5k = LinkedList.new()
4_999.times { ll5k.add_to_tail(Node.new("1")) }
node_to_delete = Node.new("2")
ll5k.add_to_tail(node_to_delete)

Benchmark.bm do |x|
  x.report("Array, 10k:       ") { 10_000.times do; arr.push("1"); end }
  x.report("LList, 10k:       ") { 10_000.times do; ll.add_to_tail(Node.new("1")) end}
  puts ""
  x.report("Array, 5k access: ") { arr[4999] }
  x.report("LList, 5k access: ") { ll.delete(node_to_delete) }
  puts ""
  x.report("Array, 5k delete: ") { arr.delete_at(5000) }
end
