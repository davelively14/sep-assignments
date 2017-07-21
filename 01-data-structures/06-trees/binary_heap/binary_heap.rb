require_relative 'node'

class BinaryHeap
  attr_reader :items

  def initialize(node=nil)
    node ? @items = [node] : @items = []
    # I realize I don't need to maintain a size, but I'm doing so because some
    # langauges don't have a #size method for the Array.
    @size = @items.size
  end

  def insert(node)
    @size += 1
    @items[@size - 1] = node
    sort(@size - 1)
  end

  def sort(node_index)
    return if node_index == 0

    parent_index = parent(node_index)

    if @items[node_index].rating < @items[parent_index].rating
      swap(node_index, parent_index)
      sort(parent_index)
    end
  end

  def find(data)
    node = nil

    @items.each do |item|
      if item.title == data
        node = item
        break
      end
    end

    return node
  end

  def print
    str = ""
    @items.each { |item| str << "#{item.title}: #{item.rating}\n" }
    puts str
    return str
  end

  def swap(first, second)
    temp = @items[first]
    @items[first] = @items[second]
    @items[second] = temp
  end

  def parent(node_index)
    (node_index.to_f / 2).round - 1
  end
end
