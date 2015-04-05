require 'rspec'
require_relative '../../search/depth-first-search'

describe 'iterative depth first search' do
  
  before(:each) do
    @graph = Graph.new
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
    @graph.add_node(@node1)
    @graph.add_node(@node2)
    @graph.add_node(@node3)
    @graph.add_edge(@node1, @node2)
    @graph.add_edge(@node1, @node3)
  end

  it 'finds all nodes in a graph' do
    expect(@graph.iterative_depth_first_search(@node1)).to contain_exactly(@node1, @node2, @node3)
  end
end

describe 'recursive depth first search' do
  
  before(:each) do
    @graph = Graph.new
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
    @graph.add_node(@node1)
    @graph.add_node(@node2)
    @graph.add_node(@node3)
    @graph.add_edge(@node1, @node2)
    @graph.add_edge(@node1, @node3)
  end

  it 'finds all nodes in a graph' do
    expect(@graph.recursive_depth_first_search(@node1)).to contain_exactly(@node1, @node2, @node3)
  end
end