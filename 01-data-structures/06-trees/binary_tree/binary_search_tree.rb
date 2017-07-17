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
  def find(root, data)
    return root if root && root.title == data

    found_node = nil

    found_node = find(root.left, data) if root.left
    found_node = find(root.right, data) if !found_node && root.right

    return found_node
  end

  def delete(root, data)
    return nil if !root || !data

    parent = find_parent(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end

  def find_parent(root, data)
    return nil if !root
    return "root" if @root.title == data
    return root if (root.left && (root.left.title == data)) || (root.right && (root.right.title == data))

    found_node = nil

    found_node = find_parent(root.left, data) if root.left
    found_node = find_parent(root.right, data) if !found_node && root.right

    return found_node
  end
end
