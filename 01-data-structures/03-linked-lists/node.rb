class Node
  attr_reader :next, :data

  def initialize(data)
    @next = nil
    @data = data
  end

  def set_next(node)
    @next = node
  end

  def clear_next
    @next = nil
  end
end
