class LRUCache
  def initialize(size)
    @size = size
    @store = []
  end

  def count
    @store.count
  end

  def add(el)
    if @store.include?(el)
      @store.delete(el)
      @store << el
    elsif count >= @size
      @store.shift
      @store << el
    else
      @store << el
    end
  end

  def show
    @store
  end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


p johnny_cache.show
