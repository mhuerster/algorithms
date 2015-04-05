require_relative 'linked-list'

class Stack
  attr_accessor :store

  def initialize
    @store = SinglyLinkedList.new
  end

  def push(value)
    @store.insert_at_head(SinglyLinkedNode.new(value))
  end

  def pop
    @store.delete_head
  end

  def peek
    @store.head.value
  end

  def size
    @store.size
  end

  def empty?
    @store.size == 0
  end
end