require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating <= root.rating
      !root.left ? root.left = node : insert(root.left, node)
    else
      !root.right ? root.right = node : insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  # TODO: refactor the root
  def find(root, data)
    return root if root && root.title == data

    found_node = nil

    found_node = find(root.left, data) if root.left
    found_node = find(root.right, data) if !found_node && root.right

    return found_node
  end

  def delete(start_node, data)
    return nil if !start_node || !data

    if @root.title == data
      @root.right ? min = return_min_node(@root.right) : min = nil

      if min
        min.left = @root.left
        min.right = @root.right if @root.right != min
        @root = min
        puts @root
        puts @root.left
        puts @root.right
      else
        @root = @root.left
      end
    else
      find_and_delete(start_node, data)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end

  def return_min_node(root)
    return root.left ? return_min_node(root.left) : root
  end

  def find_and_delete(node, data)
    if node.left && node.left.title == data
      delete_node(node, node.left)
    elsif node.right && node.right.title == data
      delete_node(node, node.right)
    else
      find_and_delete(node.left, data) if node.left
      find_and_delete(node.right, data) if node.right
    end
  end

  def delete_node(parent, target)
    target.right ? min = return_min_node(target.right) : min = nil

    if min
      min.left = target.left
      min.right = target.right if target.right != min
      parent.left == target ? parent.left = min : parent.right = min
    else
      parent.left == target ? parent.left = target.left : parent.right = target.left
    end
  end
end
