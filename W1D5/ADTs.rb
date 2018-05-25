class Stack
  def initialize
    @stack = []
    # create ivar to store stack here!
  end

  def add(el)
    stack.push(el)
    # adds an element to the stack
  end

  def remove
    stack.pop
    # removes one element from the stack
  end

  def show
    stack
    # return a copy of the stack
  end

  private
  attr_accessor :stack
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
  end

  def dequeue
    queue.shift
  end

  def show
    queue
  end

  private
  attr_accessor :queue
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key)
      current_value = lookup(key)
      idx = map.index([key,current_value])
      map[idx] = [key, value]
    else
      map << [key, value]
    end
  end

  def lookup(key)
    map.select do |arr|
      return arr[1] if arr[0] == key
    end
    nil
  end

  def remove(key)
    data = [key, lookup(key)]
    map.delete(data) if lookup(key)
  end

  def show
    map
  end

  private
  attr_accessor :map
end

class Tree
  attr_accessor :children, :parent, :value

  def initialize(children = [], parent = nil, value = nil)
    @children = children
    @parent = parent
    @value = value
  end

  def add_child(tree)
    @children << tree
    tree.parent = self
  end

  def search(search_value) #search children and children of children recursively
    return self if value == search_value

    children.each do |child|
      return child if child.value == value

      possible = child.search(search_value)
      return possible if possible
    end
    nil
  end

  def no_children?
    children.empty?
  end

  def ==(tree)
    value == tree.value
  end
end

#test
a = Tree.new([],nil,1)
b = Tree.new([],nil,2)
c = Tree.new([],nil,3)
d = Tree.new([],nil,4)
e = Tree.new([],nil,5)
f = Tree.new([],nil,6)

b.add_child(e)
a.add_child(b)

d.add_child(f)
c.add_child(d)

root = Tree.new([a,c], nil, nil)

p root_tree = root.search(1)
puts root_tree.value
p b_tree = root.search(2)
puts b_tree.value
p c_tree = root.search(3)
puts c_tree.value
p d_tree = root.search(4)
puts d_tree.value
p e_tree = root.search(5)
puts e_tree.value
p f_tree = root.search(6)
puts f_tree.value
