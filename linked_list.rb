class Node
  attr_accessor :value, :next

  def initialize(val)
    @value = val
  end

end


class List
  include Enumerable

  attr_accessor :head, :tail

  def initialize(*objs)
    #we want an array of nodes because we were working with nodes and it is much eaiser to work with it 
    nodes = []
    objs.each {|obj| nodes << Node.new(obj)}

    if nodes.empty?
      @head = @tail = nil
    else 
      nodes.each do |node|
        append(node)
      end
    end
  end

  def size
   reduce(0){|acc, obj| acc += 1} 
  end

  def to_s
    "#{@head.value}, #{@tail.value}"
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

  def select
    #super as difined in the enurable will only return an array of nodes 
    #becuase that is basically what we are passing in with this block {|node| node.value.odd?}
    #So we need to extract the value from those nodes and will get and array [1,3,5] 
    #That is still not very useful because they the initialize method will take it as only one value (the entire array)
    #So we need to add another splat operatior before *, this will basically parse out the values inside the array to convert then into individual values 
    List.new(*super)
  end

  def display
   if empty?
     puts "The list is currently empty"
   else
     each {|value| puts value.inspect}
   end
  end

  def delete_head
    return if empty?
    node = @head
    @head = @head.next
    node.next = nil
  end

  def delete_tail
    return if empty?
    each_node do |node|
      if node.next == @tail
        @tail = node
        @tail.next = nil
      end
    end
  end

  def each_node
    current_node = @head
    loop do
      yield(current_node)
      break if current_node == @tail
      current_node = current_node.next
    end
  end

  def each
    current_node = @head
    loop do
      yield(current_node.value)
      break if current_node == @tail
      current_node = current_node.next
    end
  end
end

list = List.new(4,8,5,6,7,9)
new_list = list.select{|value| value.odd?}

new_list.display
new_list.delete_tail
new_list.delete_head
puts '-----'
new_list.display

