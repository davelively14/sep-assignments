require_relative 'node'

class LinkedList
  attr_reader :head, :tail

  def initialize(node = nil)
    @head = node
    @tail = node
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail
      @tail.next = node
      @tail = node
    else
      @head = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    remove_node(@tail)
  end

  # This method prints out a representation of the list.
  def print
    print_node(@head)
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    remove_node(node)
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = node
    @head = node
    @tail = node if !@tail
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    remove_node(@head)
  end

  def length
    count = 0
    current_node = @head

    while current_node
      count += 1
      current_node = current_node.next
    end

    return count
  end

  private

  def remove_node(node)
    if @head && (@head != @tail)
      traverse_and_remove_node(@head, node)
    else
      @head = nil
      @tail = nil
    end
  end

  def traverse_and_remove_node(current_node, target_node)
    if !current_node
      return nil
    end

    if @head == target_node
      @head = @head.next
    elsif current_node.next == target_node
      current_node.next = target_node.next
      @tail = current_node if target_node == @tail
    else
      traverse_and_remove_node(current_node.next, target_node)
    end
  end

  def print_node(current_node, str = "")
    str += "{key: #{current_node.key}, value: #{current_node.value}}"
    if current_node.next
      str += ", "
      print_node(current_node.next, str)
    else
      return str
    end
  end
end
