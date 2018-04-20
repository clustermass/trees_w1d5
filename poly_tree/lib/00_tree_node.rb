class PolyTreeNode

  attr_accessor :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent_node)
    @parent.children.reject! {|polynode| polynode == self } unless @parent.nil?
    @parent = parent_node
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "This is not nodes' child!" if @children.none? {|child| child == child_node}
    child_node.parent = nil
  end

end
