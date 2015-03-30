require 'rspec'
require_relative '../../data-structures/graph'

describe 'graph' do

  before(:each) do
    @graph = Graph.new
  end
  
  it 'is initialized empty' do
    expect(@graph.nodes).to be_empty
    expect(@graph.edges).to be_empty
  end

  it 'can have a single node' do
    node = Node.new(1)
    @graph.add_node(node)
    expect(@graph.nodes).to contain_exactly(node)
  end

  it 'can add an edge between two nodes' do
    node1 = Node.new(1)
    node2 = Node.new(2)
    @graph.add_node(node1)
    @graph.add_node(node2)
    @graph.add_edge(node1, node2)
    expect(@graph.edges.length).to eq(1)
  end

  it 'cannot have an edge without exactly two nodes' do
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    @graph.add_node(node1)
    @graph.add_node(node2)
    @graph.add_node(node3)
    expect { @graph.add_edge(node1) }.to raise_error(ArgumentError)
    expect { @graph.add_edge(node1, node2, node3) }.to raise_error(ArgumentError)
  end

  it 'cannot add an edge unless both nodes exist in the graph' do
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    @graph.add_node(node1)
    @graph.add_node(node2)
    expect { @graph.add_edge(node1, node3) }.to raise_error('node must exist')
  end
end