require 'rspec'
require_relative '../../search/binary_search'

describe 'recursive binary search' do
  it 'returns the index of the target element if included in the array' do
    sorted_array = [1,2,3,4,5,6,7,8]
    expect(recursive_binary_search(sorted_array, 5)).to eq(4)
  end

  it 'returns -1 if the target element is not included in the array' do
    sorted_array = [1,2,3,4,5,6,7,8]
    expect(recursive_binary_search(sorted_array, 9)).to eq(-1)
  end

  it 'returns the smallest index if the target element appears in the array more than once' do
    sorted_array = [1,2,3,3,4,5,6,7,8]
    expect(recursive_binary_search(sorted_array, 3)).to eq(2)
  end
end