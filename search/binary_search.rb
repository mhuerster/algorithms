def recursive_binary_search(arr, target)
  # assumes that input array will always be sorted
  midpoint = arr.length/2
  return midpoint if arr[midpoint] == target
  return -1 if arr.length == 1
  if target > arr[midpoint]
    recursive_binary_search(arr[midpoint...arr.length], target)
  else
    recursive_binary_search(arr[0...midpoint], target)
  end
end

def iterative_binary_search(arr, target)
end