fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octopus(fishes)
  fishes.each_with_index do |fish1, idx1|
    max_length = true
    fishes.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      max_length = false if fish2.length > fish1.length
    end
    return fish1 if max_length
  end
end

p sluggish_octopus(fishes)

class Array
  def merge_sort(&prc)
    prc ||= Proc.new{|a,b| a <=>b}
    return self if self.length <= 1

    mid = self.length/2
    left_side = self.take(mid).merge_sort(&prc)
    right_side = self.drop(mid).merge_sort(&prc)
    Array.merge(left_side, right_side, &prc)
  end

  private

  def self.merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        sorted << left.shift
      elsif prc.call(left.first, right.first) == 0
        sorted << left.shift
      elsif prc.call(left.first, right.first) == 1
        sorted << right.shift
      end
    end
    sorted.concat(left)
    sorted.concat(right)
    sorted
  end
end

def dominant_octopus(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc).first
end

p dominant_octopus(fishes)

def clever_octopus(fishes)
  largest = fishes.first
  fishes.each do |fish|
    largest = fish if fish.length > largest.length
  end
  largest
end

p clever_octopus(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down",
"left-down", "left", "left-up"]

tiles_hash ={
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def slow_dance_octopus(direction, tiles_array)
  tiles_array.each_index do |idx|
    return idx if direction == tiles_array[idx]
  end
end


def constant_dance_octopus(direction, tiles_hash)
  tiles_hash[direction]
end

p slow_dance_octopus("up", tiles_array)
p slow_dance_octopus("right-down", tiles_array)
p constant_dance_octopus("up", tiles_hash)
p constant_dance_octopus("right-down", tiles_hash)
