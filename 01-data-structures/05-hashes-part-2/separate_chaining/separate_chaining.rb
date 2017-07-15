require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor, :items

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    true_index = index(key, size)

    if !@items[true_index]
      @items[true_index] = LinkedList.new(Node.new(key, value))
    else
      @items[true_index].add_to_tail(Node.new(key, value))
    end

    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    true_index = index(key, size)

    @items[true_index] ? return_from_llist(@items[true_index], key) : nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    value = 0

    key.each_byte { |c| value = value + c }

    return value % size
  end

  # Calculate the current load factor
  # length_of_each_linked_list / size
  def load_factor
    total = 0

    @items.each do |ll|
      total = total + ll.length if ll
    end

    return total.to_f / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_array = Array.new(size * 2)

    @items.each do |item|
      new_array[index(item.head.key, new_array.length)] = item if item
    end

    @items = new_array
  end

  private

  def return_from_llist(llist, key)
    current_node = llist.head
    value = nil

    while current_node && !value
      if current_node.key == key
        value = current_node.value
      else
        current_node = current_node.next
      end
    end

    return value
  end
end
