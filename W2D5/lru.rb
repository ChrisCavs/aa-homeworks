class LRUCache
  attr_reader :cache, :size

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    cache.reduce(0) { |acc, x| x ? acc += 1 : acc }
  end

  def add(el)
    if cache.include?(el)
      cache.delete(el)
      cache << el
    elsif count == size
      cache.shift #delete least recently used
      cache << el
    else
      cache << el
    end
    # adds element to cache according to LRU principle
  end

  def show
    print cache
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end
