class Node
  attr_accessor :value, :next

  def initialize(val)
    @value = val
  end

end


class List
  include Enumerable

  attr_accessor :head, :tail

  def initialize(nodes = [])
    if nodes.empty?
      @head = @tail = nil
    else 
      nodes.each do |node|
        append(node)
      end
    end
  end

  def empty?
    @head.nil? && @tail.nil?
  end

  def append(node)
    if empty?
      @head = @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def prepend(node)
    if empty?
      @head = @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  # def select
  #   new_list = List.new
  #   each {|node| new_list.append(node) if yield(node)}
  #   new_list
  # end

  def display
    each {|node| puts node.value}
  end

  def each
    current_node = @head
    loop do
      yield(current_node)
      break if current_node == @tail
      current_node = current_node.next
    end
  end
end


node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node0 = Node.new(0)

list = List.new([node1, node2, node3])

new_list = List.new(list.select{|node| node.value.odd?})
new_list.display



# Initialy what we want with the list is to add the prepend and append funtionality to order nodes
# tracking correctly the position of the head and the tail is crucial
# Then I want to display the list going through the list and extract the node values
# I want to be able to create a new list of nodes if the values are odd, hint we can use the yield statement for this.
# in order the use yield we can define a method without input parameters
# def test
# end 
# When calling the method we can pass in the block.
# To activate the block inside the method we can yield it
# if the block has the form of {|a| a.value.odd?} 
# we can pass in values to the yield statement to evaluate a#since we are going to see redundance in the methods we use to loop through we can generalize by creating our own each method
# Then we can include the enumerable method to top ip up yeikkk

