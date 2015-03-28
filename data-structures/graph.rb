class Node
  attr_accessor :value

  def initialize(value)
    @value = value
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
  end
end