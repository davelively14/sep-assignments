require_relative 'node'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head
      @tail.set_next(node)
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
    node.set_next(@head)
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next if @head
  end

  private

  def remove_node(target_node)
    if @head && (@head != @tail)
      traverse_and_remove_node(@head, target_node)
    else
      @head = nil
      @tail = nil
    end
  end

  def traverse_and_remove_node(current_node, target_node)
    # Base case: doesn't exist
    if !current_node
      return nil
    end

    # Keeps progressing through the list unless the target_node is @head or next node is the target_node.
    if @head == target_node
      @head = @head.next
    elsif current_node.next == target_node
      current_node.set_next(target_node.next)
      @tail = current_node if target_node == @tail
    else
      traverse_and_remove_node(current_node.next, target_node)
    end
  end

  def print_node(current_node)
    if current_node
      puts current_node.data
      print_node(current_node.next)
    end
  end
end
