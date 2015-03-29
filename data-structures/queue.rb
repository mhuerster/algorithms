require_relative 'linked-list'

class Queue
  attr_accessor :store

  def initialize
    @store = DoublyLinkedList.new
  end

  def enqueue(value)
    @store.insert_at_head(DoublyLinkedNode.new(value))
  end

  def dequeue
    @store.delete_at_tail
  end

  def empty?
    @store.size == 0
  end

  def size
    @store.size
  end

  def head
    @store.head.value
  end

  def tail
    @store.tail.value
  end

end