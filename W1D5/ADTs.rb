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
