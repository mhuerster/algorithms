def merge_sort(arr)
  length = arr.length
  midpoint = length/2

  return arr if length < 2

  left_half = arr[0..midpoint-1]
  right_half = arr[midpoint..length]

  merge(merge_sort(left_half), merge_sort(right_half))

end

def merge(left_arr, right_arr)
  merged_arr = []
  until left_arr.empty? && right_arr.empty?
    if left_arr.empty?
      merged_arr << right_arr.shift
    elsif right_arr.empty?
      merged_arr << left_arr.shift
    elsif left_arr[0] <= right_arr[0]
      merged_arr << left_arr.shift
    elsif right_arr[0] < left_arr[0]
      merged_arr << right_arr.shift
    end
  end
  merged_arr
end