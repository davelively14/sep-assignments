require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    true_index = index(key, size)

    while @items[true_index] && value != @items[true_index].value
      resize
    end

    new_item = HashItem.new(key, value)
    @items[true_index] = new_item
  end


  def [](key)
    true_index = index(key, size)
    @items[true_index].value if @items[true_index]
  end

  def resize
    new_array = Array.new(size * 2)
    @items.each do |item|
      new_array[index(item.key, new_array.length)] = item if item
    end
    @items = new_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    value = 0

    key.each_byte { |c| value = value + c }

    return value % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
