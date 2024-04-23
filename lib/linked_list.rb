require_relative 'node'

class LinkedList
  attr_accessor :head,:tail,:size

  def initialize()
    @head = nil
    @tail = nil
    @size = 0
  end
  def append(key,value)
    @size += 1
    if @tail == nil
      @tail = Node.new(key,nil,value)
    else
      @tail.next_node = Node.new(key,nil,value)
      @tail = @tail.next_node
    end
    @head = @tail if @head == nil
  end
  def prepend(key,value)
    @size += 1
    if @head == nil
      next_node = nil
    else
      next_node = @head
    end
    @head = Node.new(key,next_node)
  end

  def each
    current_node = @head
    until current_node.nil?
      yield(current_node) if block_given?
      current_node = current_node.next_node
    end
  end

  def each_with_index
    return self unless block_given?
    index = 0
    self.each do |variable|
      yield(variable, index)
      index += 1
    end
  end
  def at(index)
    index = @size + index if index < 0
    return "bad input" if index > @size || index < 0
    self.each_with_index {|node,current_index| return node if current_index == index}
  end
  def pop
    @size =- 1
    self.at(-2).next_node = nil
    @tail = self.at(-2)
  end
  def contains?(key) 
    return true if self.each{|node| return true if node.key == key}
    false
  end
  def find(key)
    self.each_with_index {|node,index| return index if key == node.key}
  end
  def to_s
    self.each do |node|
      if node.value !=  nil
        print "(#{node.key} -> #{node.value}) -> "
      elsif node.key !=  nil
        print "(#{node.key}) -> "
      else
        print "#{node.key}\n"
      end
    end
  end
  def insert_at(key,index)
    before_node = at(index - 1)
    old_node = at(index)
    new_node = Node.new(key,old_node)
    before_node.next_node = new_node
    @size += 1
  end
  def remove_at(index)
    before_node = at(index - 1)
    old_node = at(index)
    @size =- 1
    if old_node == @head
      if old_node == @tail
        @tail = nil
        old_node = nil
      end
        @head = nil
        return
    end
    before_node.next_node = old_node.next_node
    old_node = nil
  end
end
