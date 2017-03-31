class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index {|pair| pair[0] == key}
    if pair_index
      @map[pair_index][1] = value
    else
      @map.push([key, value])
    end
    [key, value]
  end

  def lookup(key)
    @map.each {|pair| return pair[1] if pair[0] == key}
    nil
  end

  def remove(key)
    @map.reject! {|pair| pair[0] == key}
    nil
  end

  def show
    deep_dup(@map)
  end

  private

  def deep_dup(arr)
    arr.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end
  end

end
