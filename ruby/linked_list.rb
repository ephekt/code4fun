class LinkedList

  class Node
    def initialize(value, next_node = nil)
      @val = value
      @next = next_node
    end
    attr_reader :next, :val
    attr_writer :next
    
    def to_s
      val.to_s
    end
  end

  def initialize(value = nil)
    @head = Node.new(value) if value
  end

  def first
    @head
  end

  def add_to_front(value)
    node = Node.new(value)
    node.next = @head
    @head = node
  end
  
  def last
    node = @head
    until node.next.nil?
      node = node.next
    end
    
    node
  end

  def add_to_end(value)
    if node = last
      node.next = Node.new(value)
    else
      add_to_front value
    end
  end

  def each
    node = @head
    until node.nil?
      yield node
      node = node.next
    end
  end
    
  # return a new linkedlist
  def reverse
    new_list = LinkedList.new()
    
    each { |node| new_list.add_to_front node.val }
    
    new_list
  end
  
  def pop!
    node = @head
    
    @head = node.next if @head

    node
  end
  
  def reverse!    
    current = @head
    previous = nil

    until current.next.nil?
      next_node = current.next # save next node
      current.next = previous # point back to the last node
      previous = current # update last node to this one
      
      current = next_node
      # puts "#{previous || "N/A"} -> #{current} -> #{current.next}"
    end
    
    current.next = previous
    @head = current
    
    self
  end
end

# have some fun with this....

list = LinkedList.new("1")
list.add_to_end("2")
list.add_to_end("3")
list.add_to_end("4")
list.add_to_end("5")
puts "each"
list.each { |node| puts node.val }
puts "Reverse"
list.reverse.each { |node| puts node.val }
puts "reverse.Reverse!"
list.reverse.reverse!.each { |node| puts node.val }