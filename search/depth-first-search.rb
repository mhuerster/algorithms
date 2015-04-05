require_relative '../data-structures/graph'
require_relative '../data-structures/stack'
# explore aggressively, only backtrack when necessary
# good for solving something like a maze

class Graph
  def iterative_depth_first_search(start_node)
    visited_nodes = {}
    nodes_to_visit = Stack.new
    nodes_to_visit.push(start_node)
    until nodes_to_visit.empty?
      node = nodes_to_visit.pop
      visited_nodes.store(node, true)
      node.neighbors.each { |neighbor| nodes_to_visit.push(neighbor) unless visited_nodes.has_key?(neighbor) }
    end
    visited_nodes.keys
  end

  def recursive_depth_first_search(start_node)
    visited_nodes = {}
    visited_nodes.store(start_node, true)
    start_node.neighbors.each do |neighbor|
      visited_nodes.store(neighbor, true)
      recursive_depth_first_search(neighbor) unless visited_nodes.has_key?(neighbor)
    end
    visited_nodes.keys
  end
end