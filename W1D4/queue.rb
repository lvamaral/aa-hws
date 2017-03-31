class Queue

  attr_accessor :queue_collection

  def initialize(queue_collection)
    @queue_collection = queue_collection
  end

  def enqueue(el)
    queue_collection.unshift(el)
  end

  def dequeue
    queue_collection.pop
  end

  def show
    queue_collection.dup
  end
  
end
