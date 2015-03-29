require 'rspec'
require 'benchmark'
require_relative '../../data-structures/linked-list'

describe 'singly linked list' do
  it 'has a head element' do
    list = SinglyLinkedList.new
    expect(list).to respond_to(:head)
  end

  it 'is initialized with head nil' do
    list = SinglyLinkedList.new
    expect(list.head).to be_nil
  end

  it 'allows insertion at head' do
    list = SinglyLinkedList.new
    head_node = SinglyLinkedNode.new(10)
    list.insert_at_head(head_node)
    expect(list.head.value).to eq(10)
    expect(list.size).to eq(1)
  end

  xit 'insertion at head is faster for LL than array' do
    list = SinglyLinkedList.new
    array = Array.new
    
    [10, 20, 30, 40, 50, 60, 70, 80, 90].each do |num|
      array.unshift(num)
      list.insert_at_head(SinglyLinkedNode.new(num))
    end
    
    new_node = SinglyLinkedNode.new(100)
    ll = Proc.new { |list| list.insert_at_head(new_node) }
    arr = Proc.new { |array| array.unshift(100) }

    expect(Benchmark.realtime { ll.call(list) }).to be < (Benchmark.realtime { arr.call(array) })
    expect(list.head.value).to eq(100)
    expect(array[0]).to eq(100)
  end

  it 'allows insertion at tail' do
    list = SinglyLinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_tail(SinglyLinkedNode.new(30))
    expect(list.size).to eq(3)
    expect(list.value_at_index(2)).to eq(30)
  end

  it 'allows insertion in middle' do
    list = SinglyLinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_index(SinglyLinkedNode.new(30), 1)
    expect(list.size).to eq(3)
    expect(list.value_at_index(1)).to eq(30)
  end

  it 'allows deletion at head' do
    list = SinglyLinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_head(SinglyLinkedNode.new(30))
    list.delete_head
    expect(list.size).to eq(2)
    expect(list.head.value).to eq(20)
  end

  xit 'deletion at head is faster for LL than array' do
    list = SinglyLinkedList.new
    array = Array.new
    
    [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].each do |num|
      array.unshift(num)
      list.insert_at_head(SinglyLinkedNode.new(num))
    end
    
    ll = Proc.new { |list| list.delete_head }
    arr = Proc.new { |array| array.shift }

    expect(Benchmark.realtime { ll.call(list) }).to be < (Benchmark.realtime { arr.call(array) })
    expect(list.head.value).to eq(90)
    expect(array[0]).to eq(90)
  end

  it 'allows deletion at end' do
    list = SinglyLinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_head(SinglyLinkedNode.new(30))
    list.delete_at_tail
    expect(list.size).to eq(2)
  end

  it 'allows deletion in middle' do
    list = SinglyLinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_head(SinglyLinkedNode.new(30))
    list.delete_at_index(1)
    expect(list.size).to eq(2)
    expect(list.value_at_index(1)).to eq(10)
  end

  it 'prints all values' do
    list = SinglyLinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_head(SinglyLinkedNode.new(30))
    expect(list.print).to eq([30, 20, 10])
  end
end

describe 'doubly linked list' do
  it 'has a head element' do
    list = DoublyLinkedList.new
    expect(list).to respond_to(:head)
    expect(list).to respond_to(:tail)
  end

  it 'is initialized with head nil' do
    list = DoublyLinkedList.new
    expect(list.head).to be_nil
  end

  it 'is initialized with tail nil' do
    list = DoublyLinkedList.new
    expect(list.tail).to be_nil
  end

  it 'allows insertion at head' do
    list = DoublyLinkedList.new
    head_node = DoublyLinkedNode.new(10)
    list.insert_at_head(head_node)
    expect(list.head.value).to eq(10)
    expect(list.size).to eq(1)
  end

  xit 'insertion at head is faster for LL than array' do
    list = DoublyLinkedList.new
    array = Array.new
    
    [10, 20, 30, 40, 50, 60, 70, 80, 90].each do |num|
      array.unshift(num)
      list.insert_at_head(DoublyLinkedNode.new(num))
    end
    
    new_node = DoublyLinkedNode.new(100)
    ll = Proc.new { |list| list.insert_at_head(new_node) }
    arr = Proc.new { |array| array.unshift(100) }

    expect(Benchmark.realtime { ll.call(list) }).to be < (Benchmark.realtime { arr.call(array) })
    expect(list.head.value).to eq(100)
    expect(array[0]).to eq(100)
  end

  it 'allows insertion at tail' do
    list = DoublyLinkedList.new
    list.insert_at_head(DoublyLinkedNode.new(10))
    list.insert_at_head(DoublyLinkedNode.new(20))
    list.insert_at_tail(DoublyLinkedNode.new(30))
    expect(list.size).to eq(3)
    expect(list.value_at_index(2)).to eq(30)
  end

  it 'allows insertion in middle' do
    list = DoublyLinkedList.new
    list.insert_at_head(DoublyLinkedNode.new(10))
    list.insert_at_head(DoublyLinkedNode.new(20))
    list.insert_at_index(DoublyLinkedNode.new(30), 1)
    expect(list.size).to eq(3)
    expect(list.value_at_index(1)).to eq(30)
  end

  it 'allows deletion at head' do
    list = DoublyLinkedList.new
    list.insert_at_head(DoublyLinkedNode.new(10))
    list.insert_at_head(DoublyLinkedNode.new(20))
    list.insert_at_head(DoublyLinkedNode.new(30))
    list.delete_head
    expect(list.size).to eq(2)
    expect(list.head.value).to eq(20)
  end

  xit 'deletion at head is faster for LL than array' do
    list = DoublyLinkedList.new
    array = Array.new
    
    [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].each do |num|
      array.unshift(num)
      list.insert_at_head(DoublyLinkedNode.new(num))
    end
    
    ll = Proc.new { |list| list.delete_head }
    arr = Proc.new { |array| array.shift }

    expect(Benchmark.realtime { ll.call(list) }).to be < (Benchmark.realtime { arr.call(array) })
    expect(list.head.value).to eq(90)
    expect(array[0]).to eq(90)
  end

  it 'allows deletion at end' do
    list = DoublyLinkedList.new
    list.insert_at_head(DoublyLinkedNode.new(10))
    list.insert_at_head(DoublyLinkedNode.new(20))
    list.insert_at_head(DoublyLinkedNode.new(30))
    list.delete_at_tail
    expect(list.size).to eq(2)
    expect(list.tail.next_node).to be_nil
  end

  it 'allows deletion in middle' do
    list = DoublyLinkedList.new
    list.insert_at_head(DoublyLinkedNode.new(10))
    list.insert_at_head(DoublyLinkedNode.new(20))
    list.insert_at_head(DoublyLinkedNode.new(30))
    list.delete_at_index(1)
    expect(list.size).to eq(2)
    expect(list.value_at_index(1)).to eq(10)
  end

  it 'prints all values from head to tail' do
    list = DoublyLinkedList.new
    list.insert_at_head(DoublyLinkedNode.new(10))
    list.insert_at_head(DoublyLinkedNode.new(20))
    list.insert_at_head(DoublyLinkedNode.new(30))
    expect(list.print_forward).to eq([30, 20, 10])
  end

  it 'prints all values from tail to head' do
    list = DoublyLinkedList.new
    list.insert_at_head(DoublyLinkedNode.new(10))
    list.insert_at_head(DoublyLinkedNode.new(20))
    list.insert_at_head(DoublyLinkedNode.new(30))
    expect(list.print_reverse).to eq([10, 20, 30])
  end
end