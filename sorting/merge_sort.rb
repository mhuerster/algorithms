def merge_sort(arr)
  length = arr.length
  
  return arr if length < 2

  left_arr = arr[0...length/2]
  right_arr = arr[length/2...length]
  
  merge(merge_sort(left_arr), merge_sort(right_arr))
end

def merge(arr1, arr2)

  merged_arr = []
  pointer1 = 0
  pointer2 = 0

  until merged_arr.length == arr1.length + arr2.length
    if arr1[pointer1].nil?
      merged_arr << arr2[pointer2]
      pointer2 += 1
    elsif  arr2[pointer2].nil?
      merged_arr << arr1[pointer1]
      pointer1 += 1
    elsif arr1[pointer1] >= arr2[pointer2]
      merged_arr << arr2[pointer2]
      pointer2 += 1
    elsif arr2[pointer2] > arr1[pointer1]
      merged_arr << arr1[pointer1]
      pointer1 += 1
    end
  end
  merged_arr
end