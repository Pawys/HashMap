# HashMap Implementation in Ruby

This is a simple implementation of a hash map data structure in Ruby. It uses separate chaining with linked lists to handle collisions.

## Features

- **Set**: Adds a key-value pair to the hash map. If the key already exists, it updates the value.
- **Get**: Retrieves the value associated with a given key.
- **Has**: Checks if a key exists in the hash map.
- **Remove**: Removes a key-value pair from the hash map.
- **Length**: Returns the number of key-value pairs in the hash map.
- **Clear**: Clears the hash map.
- **Keys**: Returns an array of all keys in the hash map.
- **Values**: Returns an array of all values in the hash map.
- **Entries**: Returns an array of all key-value pairs in the hash map.

## Usage

```ruby
require_relative 'lib/linked_list.rb'

# Initialize a new HashMap
hash_map = HashMap.new()

# Set key-value pairs
hash_map.set("key1", "value1")
hash_map.set("key2", "value2")
hash_map.set("key3", "value3")

# Get value by key
value = hash_map.get("key1")
puts value  # Output: "value1"

# Check if key exists
exists = hash_map.has("key2")
puts exists  # Output: true

# Remove key-value pair
hash_map.remove("key3")

# Get all keys, values, or entries
keys = hash_map.keys()
values = hash_map.values()
entries = hash_map.entries()

puts keys    # Output: ["key1", "key2"]
puts values  # Output: ["value1", "value2"]
puts entries # Output: [["key1", "value1"], ["key2", "value2"]]
```
