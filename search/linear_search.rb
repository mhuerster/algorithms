def linear_search(arr, target)
  (0...arr.length).each { |i| return i if arr[i] == target }
  return -1
end