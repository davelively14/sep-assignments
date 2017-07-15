include RSpec

require_relative 'linked_list'
require_relative 'node'

RSpec.describe LinkedList, type: Class do
  let(:node) { Node.new("k1", "v1")}
  let(:llist) { LinkedList.new(node) }

  describe "#initialize" do
    it "creates a new LinkedList, with head and tail set to same" do
      node = Node.new("key", "value")
      ll = LinkedList.new(node)
      expect(ll.head).to eq node
      expect(ll.tail).to eq node
    end

    it "creates a new LinkedList with head and tail set to nil if no node passed" do
      ll = LinkedList.new()
      expect(ll.head).to be_nil
      expect(ll.tail).to be_nil
    end
  end

  describe "#add_to_tail" do
    it "adds to tail" do
      new_node = Node.new("k2", "v2")
      llist.add_to_tail(new_node)
      expect(llist.head).to eq node
      expect(llist.tail).to eq new_node
    end

    it "adds to tail when the LinkedList is empty" do
      llist.remove_tail

      expect(llist.head).to be_nil
      expect(llist.tail).to be_nil

      new_node = Node.new("k2", "v2")
      llist.add_to_tail(new_node)
      expect(llist.head).to eq new_node
      expect(llist.tail).to eq new_node
    end
  end

  describe "#remove_tail" do
    it "removes a tail when more than one node" do
      new_node = Node.new("k2", "v2")
      llist.add_to_tail(new_node)

      expect(llist.head).to eq node
      expect(llist.tail).to eq new_node

      llist.remove_tail

      expect(llist.head).to eq node
      expect(llist.tail).to eq node
    end

    it "removes a tail when tail = head" do
      llist.remove_tail

      expect(llist.head).to be_nil
      expect(llist.tail).to be_nil
    end
  end

  describe "#delete" do
    it "deletes node" do
      llist.delete(node)
      expect(llist.head).to be_nil
      expect(llist.tail).to be_nil
    end
  end

  describe "#print" do
    it "prints a single node" do
      expect(llist.print).to eq "{key: #{node.key}, value: #{node.value}}"
    end

    it "prints multiple nodes separated by a comma" do
      new_node = Node.new("k2", "v2")
      llist.add_to_tail(new_node)

      expect(llist.print).to eq "{key: #{node.key}, value: #{node.value}}, {key: #{new_node.key}, value: #{new_node.value}}"
    end
  end

  describe "#add_to_front" do
    it "adds node to front when @head already exists" do
      new_node = Node.new("k2", "v2")
      llist.add_to_front(new_node)
      expect(llist.head).to eq new_node
      expect(llist.tail).to eq node
    end

    it "adds node to front when no @head exists" do
      new_node = Node.new("k2", "v2")
      llist.delete(node)
      llist.add_to_front(new_node)

      expect(llist.head).to eq new_node
      expect(llist.tail).to eq new_node
    end
  end

  describe "#remove_front" do
    it "removes head and replaces with the next node" do
      node2 = Node.new("k2", "v2")
      node3 = Node.new("k3", "v3")

      llist.add_to_tail(node2)
      llist.add_to_tail(node3)

      expect(llist.head).to eq node

      llist.remove_front
      expect(llist.head).to eq node2
      expect(llist.tail).to eq node3
    end

    it "removes head and head and tail are set to nil if head = tail" do
      llist.remove_front

      expect(llist.head).to be_nil
      expect(llist.tail).to be_nil
    end

    it "does nothing if there is no node" do
      llist.delete(node)

      expect(llist.head).to be_nil
      expect(llist.tail).to be_nil

      llist.remove_front

      expect(llist.head).to be_nil
      expect(llist.tail).to be_nil
    end
  end
end
