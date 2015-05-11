#class node with value, left, and right
#stablish a root node
# We need to be able to compare values on the different
# nodes we can use the <=> operator
# we would need to insert nodes an
# We also want to be able to see if the tree includes a certain valu

class Node
  attr_accessor :left, :right, :value
  include Comparable

  def initialize(val)
    @value = val
  end

  def <=>(other_node)
    self.value <=> other_node.value
  end

  def insert(node)
    if self > node
      self.left ? left.insert(node) : self.left = node
    elsif self < node
      self.right ? right.insert(node) : self.right = node 
    else
      return
    end
  end

  def search(val)
    if self.value == val
      return true
    elsif self.value > val
      self.left ? left.search(val) : false
    elsif self.value < val
      self.right ? right.search(val) : false
    end  
  end
end

class Tree
  attr_accessor :root

  def initialize(root_value)
    @root = Node.new(root_value)
  end

  def insert(val)
    node = Node.new(val)
    @root.insert(node)
  end

  def include?(val)
    @root.search(val)
  end
end


node1 = Node.new(1)
node2 = Node.new(2)

tree = Tree.new(10)
tree.insert(16)
tree.insert(3)
tree.insert(2)
tree.insert(1)

puts tree.include?(5)
puts tree.include?(16)
puts tree.include?(2)



