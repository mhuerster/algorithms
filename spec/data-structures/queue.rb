require 'rspec'
require_relative '../../data-structures/queue'

describe 'queue' do

  before(:each) do
      @queue = Queue.new
    end
  
  it 'is initialized empty' do
    expect(@queue).to be_empty
  end

  it 'can add an element at the head' do
    @queue.enqueue(3)
    expect(@queue.size).to eq(1)
    expect(@queue.head).to eq(3)
  end

  it 'can pop an element off the tail' do
    @queue.enqueue(3)
    expect(@queue.size).to eq(1)
    expect(@queue.dequeue).to eq(3)
    expect(@queue).to be_empty
  end
end