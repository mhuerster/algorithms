# ADVANTAGES

# lookup first and last node in constant time
# insert and delete at first and last node in constant time
# good base for stack/queue implementation

# DISADVANTAGES

# lookup intermediate nodes in O(n)

class SinglyLinkedNode
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
  end
end

class DoublyLinkedNode
  attr_accessor :value, :prev_node, :next_node

  def initialize(value)
    @value = value
  end
end

class SinglyLinkedList
  attr_reader :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  def insert_at_head(node)
    old_head = @head
    @head = node
    @head.next_node = old_head
    @size += 1
  end

  def insert_at_tail(node)
    insert_at_index(node, @size)
  end

  def insert_at_index(node, index)
    insert_after = @head
    counter = 0
    while counter < index-1 do
      insert_after = insert_after.next_node
      counter +=1
    end
    temp = insert_after.next_node
    insert_after.next_node = node
    node.next_node = temp
    @size += 1
  end

  def value_at_index(index)
    current_node = @head
    counter = 0
    while counter < index
      current_node = current_node.next_node
      counter+=1
    end
    current_node.value
  end

  def delete_head
    @head = @head.next_node
    @size -= 1
  end

  def delete_at_index(index)
    delete_after = @head
    counter = 0
    while counter < index-1 do
      delete_after = delete_after.next_node
      counter +=1
    end
    temp = delete_after.next_node
    delete_after.next_node = temp.next_node
    @size -= 1
  end

  def delete_at_tail
    delete_at_index(@size-1)
  end

  def print
    values = []
    current_node = @head
    until current_node.nil?
      values << current_node.value
      current_node = current_node.next_node
    end
    puts values.inspect
    values
  end
end

class DoublyLinkedList
  attr_reader :size, :head, :tail

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def insert_at_head(node)
    raise Exception.new('must be a doubly linked node') unless node.is_a?(DoublyLinkedNode)
    if @head.nil?
      old_head = nil
    else
      old_head = @head
      old_head.prev_node = node
    end
    @head = node
    @head.prev_node = nil
    @head.next_node = old_head
    @tail = node unless @size > 0
    @size += 1
  end

  def insert_at_tail(node)
    raise Exception.new('must be a doubly linked node') unless node.is_a?(DoublyLinkedNode)
    if @tail.nil?
      old_tail = nil
    else
      old_tail = @tail
      old_tail.next_node = node
    end
    @tail = node
    @tail.prev_node = old_tail
    @tail.next_node = nil
    @head = node unless @size > 0
    @size += 1
  end

  def insert_at_index(node, index)
    raise Exception.new('must be a doubly linked node') unless node.is_a?(DoublyLinkedNode)
    insert_after = @head
    counter = 0
    while counter < index-1 do
      insert_after = insert_after.next_node
      counter +=1
    end
    temp = insert_after.next_node
    insert_after.next_node = node
    node.next_node = temp
    @size += 1
  end

  def value_at_index(index)
    current_node = @head
    counter = 0
    while counter < index
      current_node = current_node.next_node
      counter+=1
    end
    current_node.value
  end

  def delete_head
    @head = @head.next_node
    @head.prev_node = nil
    @size -= 1
  end

  def delete_at_index(index)
    delete_after = @head
    counter = 0
    while counter < index-1 do
      delete_after = delete_after.next_node
      counter +=1
    end
    temp = delete_after.next_node
    delete_after.next_node = temp.next_node
    @size -= 1
  end

  def delete_at_tail
    @tail = @tail.prev_node
    @tail.next_node = nil
    @size -= 1
  end

  def print_forward
    values = []
    current_node = @head
    until current_node.nil?
      values << current_node.value
      current_node = current_node.next_node
    end
    puts values.inspect
    values
  end

  def print_reverse
    values = []
    current_node = @tail
    until current_node.nil?
      values << current_node.value
      current_node = current_node.prev_node
    end
    puts values.inspect
    values
  end
end