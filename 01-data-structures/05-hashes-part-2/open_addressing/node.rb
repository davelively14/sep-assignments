class Node
  attr_reader :key, :value
  attr_accessor :next

  def initialize(key, value)
    @next = nil
    @key = key
    @value = value
  end
end
