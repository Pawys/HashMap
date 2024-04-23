class Node
  attr_accessor :key,:value,:next_node
  def initialize(key = nil,next_node = nil,value=nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end
