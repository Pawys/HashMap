require_relative 'lib/linked_list.rb'
class HashMap 
  attr_accessor :bucket_list
  def initialize()
    @bucket_list_size = 16
    @bucket_list = Array.new(@bucket_list_size)
    @load_factor = 0.75
  end
  def hash(key)
     hash_code = 0
     prime_number = 47
        
     key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
        
     hash_code % @bucket_list_size
  end
  def set(key,value)
    set_bucket_list_size()
    hash_key = hash(key)
    bucket = @bucket_list[hash_key]
    if bucket.nil?
      bucket = LinkedList.new() 
    elsif !bucket.find(key).nil?
      bucket.at(bucket.find(key)).value = value
      return
    end
    bucket.append(key,value)
    @bucket_list[hash_key] = bucket
  end
  def set_bucket_list_size()
    if length() >= @bucket_list_size * @load_factor
      @bucket_list_size *= 2
      @bucket_list.concat(Array.new(@bucket_list_size - @bucket_list.length))
    end
  end
  def get(key)
    hash_key = hash(key)
    bucket = @bucket_list[hash_key]
    bucket.at(bucket.find(key)).value
  end
  def has(key)
    hash_key = hash(key)
    bucket = @bucket_list[hash_key]
    return false if bucket.nil?
    bucket.contains?(key)
  end
  def remove(key)
    hash_key = hash(key)
    bucket = @bucket_list[hash_key]
    if bucket.nil? || bucket.find(key).nil?        
      return nil
    end
    bucket.remove_at(bucket.find(key))
  end
  def length()
    length = 0
    @bucket_list.each do |bucket|
      next if bucket.nil?
      length += bucket.size
    end
    length
  end
  def clear()
    @bucket_list_size = 16
    @bucket_list = Array.new(@bucket_list_size)
  end
  def keys()
    keys = Array.new()
    @bucket_list.each do |bucket|
      next if bucket.nil?
      bucket.each {|node| keys.push(node.key)}
    end
    keys
  end
  def values()
    values = Array.new()
    @bucket_list.each do |bucket|
      next if bucket.nil?
      bucket.each {|node| values.push(node.value)}
    end
    values
  end
  def entries()
    entries = Array.new()
    @bucket_list.each do |bucket|
      next if bucket.nil?
      bucket.each {|node| entries.push([node.key,node.value])}
    end
    entries
  end
end
