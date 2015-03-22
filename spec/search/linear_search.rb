require 'rspec'
require_relative '../../search/linear_search'

describe 'linear search' do
  it 'returns the index of the target element if included in a sorted array' do
    sorted_array = [1,2,3,4,5,6,7,8]
    expect(linear_search(sorted_array, 5)).to eq(4)
  end

  it 'returns the index of the target element if included in an unsorted array' do
    sorted_array = [1,5,6,4,9,3,7,8]
    expect(linear_search(sorted_array, 6)).to eq(2)
  end

  it 'returns -1 if the target element is not included in the array' do
    sorted_array = [1,2,3,4,5,6,7,8]
    expect(linear_search(sorted_array, 9)).to eq(-1)
  end

  it 'returns the smallest index if the target element appears in a sorted array more than once' do
    sorted_array = [1,2,3,3,4,5,6,7,8]
    expect(linear_search(sorted_array, 3)).to eq(2)
  end

  it 'returns the smallest index if the target element appears in an unsorted array more than once' do
    sorted_array = [9,6,3,5,3,4,6,7,5,8]
    expect(linear_search(sorted_array, 3)).to eq(2)
  end
end