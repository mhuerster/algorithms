require 'rspec'
require_relative '../../sorting/merge_sort'

describe 'merge sort' do
  it 'sorts an array of distinct elements in increasing order' do
    unsorted_array = [5,4,1,8,7,2,6,3]
    expect(merge_sort(unsorted_array)).to eq(unsorted_array.sort)
  end

  it 'sorts an array with duplicates in increasing order' do
    unsorted_array = [5,1,4,1,8,7,5,2,6,8,3,6]
    expect(merge_sort(unsorted_array)).to eq(unsorted_array.sort)
  end

  it 'sorts an array with an odd number of elements' do
    unsorted_array = [5,4,1,8,7,2,6]
    expect(merge_sort(unsorted_array)).to eq(unsorted_array.sort)
  end
end