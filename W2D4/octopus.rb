fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_oct(arr) #quadratic

  arr.each_with_index do |fish1, idx1|
    biggest = true

    arr.each_with_index do |fish2, idx2|
      next if idx2 <= idx1
      biggest = false if fish2.length > fish1.length
    end

    return fish1 if biggest
  end
end

def dominant_oct(arr)
  merge_sort(arr).first
end

def clever_oct(arr)
  biggest = arr[0]
  arr.each do |x|
    biggest = x if x.length > biggest.length
  end
  biggest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile, arr)
  arr.each_index do |idx|
    return idx if tile == arr[idx]
  end
end

tiles_hash = {
  'up' => 0,
  'right-up' => 1,
  'right' => 2,
  'right-down' => 3,
  'down' => 4,
  'left-down' => 5,
  'left' => 6,
  'left-up' => 7
}

def constant_dance(tile, hash)
  hash[tile]
end

def merge_sort(arr) # n log n
  return arr if arr.length <= 1

  middle = arr.length / 2

  left = merge_sort(arr[0...middle])
  right = merge_sort(arr[middle..-1])

  merge_helper(left, right)
end

def merge_helper(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first.length > right.first.length
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end
