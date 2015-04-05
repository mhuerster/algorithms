require 'rspec'
require_relative '../../data-structures/stack'

describe 'stack' do

  before(:each) do
      @stack = Stack.new
    end
  
  it 'is initialized empty' do
    expect(@stack).to be_empty
  end

  it 'can add an element at the head' do
    @stack.push(3)
    @stack.push(4)
    expect(@stack.size).to eq(2)
    expect(@stack.peek).to eq(4)
  end

  it 'can pop an element off the head' do
    @stack.push(3)
    @stack.push(4)
    expect(@stack.size).to eq(2)
    expect(@stack.pop).to eq(4)
    expect(@stack.size).to eq(1)
  end
end