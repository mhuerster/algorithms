# both solutions assume that input array will always contain sorted integers

def recursive_binary_search(arr, target)
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
  min = arr[0]
  max = arr[-1]
  while max > min
    midpoint = (max + min)/2
    if arr[midpoint] == target
      return midpoint
    elsif arr[midpoint] < target
      min = midpoint + 1
    else
      max = midpoint - 1
    end
  end
  return -1
end