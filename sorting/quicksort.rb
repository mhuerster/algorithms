# worst case: O(n) | linear, no extra memory
# average case: O(n log(n) )


def quicksort(arr)
  return arr if arr.length <= 1

  # set one element as pivot
  pivot = arr[0]
  
  # set bound behind which all values <= pivot
  bound = 1
  (1...arr.length).each do |i|
  
  # rearrange array so that:
    # less than pivot => left of pivot (unordered)
    # greater than pivot => right of pivot (unordered)
    # PIVOT IS NOW IN THE CORRECT POSITION
    if pivot > arr[i]
      if bound != i
        puts "swapping #{arr[i]} and #{arr[bound]}"
        arr[i], arr[bound] = arr[bound], arr[i]
      end
      bound += 1
    end
  end
  
  # recursively sort elements on either side of pivot
  quicksort(arr[1...bound]) + [pivot] + quicksort(arr[bound...arr.length])
end