require_relative '../data-structures/graph'
require_relative '../data-structures/queue'
# explore nodes in layers
# can be used to compute shortest path
# O(m+n), where n = number of nodes and m = number of edges

class Graph
  def breadth_first_search(start_node)
    visited_nodes = {}
    nodes_to_visit = Queue.new
    
    nodes_to_visit.enqueue(start_node)
    until nodes_to_visit.empty?
      node = nodes_to_visit.dequeue
      visited_nodes.store(node, true)
      node.neighbors.each { |neighbor| nodes_to_visit.enqueue(neighbor) unless visited_nodes.has_key?(neighbor) }
    end
    visited_nodes.keys
  end
end