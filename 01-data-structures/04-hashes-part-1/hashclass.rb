require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    true_index = index(key, size)

    resize while @items[true_index] && value != @items[true_index].value

    true_index = index(key, size)

    new_item = HashItem.new(key, value)
    @items[true_index] = new_item
  end


  def [](key)
    true_index = index(key, size)
    @items[true_index].value if @items[true_index]
  end

  def resize
    old_array = @items
    @items = Array.new(size * 2)
    old_array.each {|item| @items[index(item.key, size)] = item if item }
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
