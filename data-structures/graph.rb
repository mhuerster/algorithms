class Node
  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    # to avoid duplicates - see https://github.com/brianstorti/ruby-graph-algorithms/blob/master/breath_first_search/node.rb
    @neighbors = Set.new
  end
end

class Edge
  attr_accessor :nodes

  def initialize(node1, node2)
    @nodes = [node1, node2]
  end
end

class Graph
  attr_accessor :nodes, :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    raise Exception.new('must be a node') unless node.is_a?(Node)
    @nodes << node
  end

  def add_edge(node1, node2)
    raise Exception.new('node must exist') unless nodes.include?(node1) && nodes.include?(node2)
    @edges << Edge.new(node1, node2)
    node1.neighbors << node2
    node2.neighbors << node1
  end
end