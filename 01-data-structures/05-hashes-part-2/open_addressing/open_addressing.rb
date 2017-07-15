require_relative 'node'

class OpenAddressing
  attr_reader :items

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    true_index = index(key, size)
    put_item(@items, true_index, key, value)
  end

  def [](key)
    true_index = index(key, size)
    get_item(true_index, key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    value = 0

    key.each_byte { |c| value = value + c }

    return value % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    open_index = - 1

    while index < @items.size
      return index if !@items[index]
      index += 1
    end

    return open_index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_size = size * 2
    new_array = Array.new(new_size)

    @items.each do |item|
      put_item(new_array, index(item.key, new_size), item.key, item.value) if item
    end

    @items = new_array
  end

  private

  def put_item(arr, i, key, value)

    if !arr[i]
      arr[i] = Node.new(key, value)
    elsif i < size - 1
      put_item(arr, i + 1, key, value)
    else
      resize
      put_item(@items, index(key, size), key, value)
    end
  end

  def get_item(i, key)
    if @items[i].key == key
      @items[i].value
    elsif i < size - 1
      get_item(i + 1, key)
    else
      nil
    end
  end
end
