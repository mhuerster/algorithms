require 'rspec'
require_relative '../../data-structures/stack'

describe 'stack' do

  before(:each) do
      @stack = Stack.new
    end
  
  it 'is initialized empty' do
    expect(@stack).to be_empty
  end

  it 'can add an element at the tail' do
    @stack.push(3)
    expect(@stack.size).to eq(1)
    expect(@stack.head).to eq(3)
  end

  it 'can pop an element off the tail' do
    @stack.push(3)
    expect(@stack.size).to eq(1)
    expect(@stack.pop).to eq(3)
    expect(@stack).to be_empty
  end
end