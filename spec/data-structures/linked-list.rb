require 'rspec'
require 'benchmark'
require_relative '../../data-structures/linked-list'

describe 'singly linked list' do
  it 'has a head element' do
    list = LinkedList.new
    expect(list).to respond_to(:head)
  end

  it 'is initialized with head nil' do
    list = LinkedList.new
    expect(list.head).to be_nil
  end

  it 'allows insertion at head' do
    list = LinkedList.new
    head_node = SinglyLinkedNode.new(10)
    list.insert_at_head(head_node)
    expect(list.head.value).to eq(10)
    expect(list.size).to eq(1)
  end

  xit 'insertion at head is faster for LL than array' do
    list = LinkedList.new
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
    list = LinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_tail(SinglyLinkedNode.new(30))
    expect(list.size).to eq(3)
    expect(list.value_at_index(2)).to eq(30)
  end

  it 'allows insertion in middle' do
    list = LinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_index(SinglyLinkedNode.new(30), 1)
    expect(list.size).to eq(3)
    expect(list.value_at_index(1)).to eq(30)
  end

  it 'allows deletion at head' do
    list = LinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_head(SinglyLinkedNode.new(30))
    list.delete_head
    expect(list.size).to eq(2)
    expect(list.head.value).to eq(20)
  end

  xit 'deletion at head is faster for LL than array' do
    list = LinkedList.new
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
    list = LinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_head(SinglyLinkedNode.new(30))
    list.delete_at_tail
    expect(list.size).to eq(2)
  end

  it 'allows deletion in middle' do
    list = LinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_head(SinglyLinkedNode.new(30))
    list.delete_at_index(1)
    expect(list.size).to eq(2)
    expect(list.value_at_index(1)).to eq(10)
  end

  it 'prints all values' do
    list = LinkedList.new
    list.insert_at_head(SinglyLinkedNode.new(10))
    list.insert_at_head(SinglyLinkedNode.new(20))
    list.insert_at_head(SinglyLinkedNode.new(30))
    expect(list.print).to eq([30, 20, 10])
  end
end