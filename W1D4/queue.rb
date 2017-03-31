class Queue
  
  def initialize
    @queue_collection = []
  end

  def enqueue(el)
    queue_collection << el
    el
  end

  def dequeue
    queue_collection.shift
  end

  def show
    queue_collection.dup
  end

end
