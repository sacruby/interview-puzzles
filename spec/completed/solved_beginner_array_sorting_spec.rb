describe "Array Sorting" do

  def my_insertion_sort(array)
    if array.nil? or array.size < 2
      return array
    end
    
    length = array.size

    array[1..length].each_with_index do |item, index|

      while index >= 0 and array[index] > item do
        array[index + 1] = array[index]
        index = index - 1
      end
      array[index + 1] = item
    end

    array
  end

  it "should return nil" do
    my_insertion_sort(nil).should == nil
  end

  it "should return an empty array" do
   my_insertion_sort([]).should == []
  end

  it "should handle a single element array" do
    my_insertion_sort([1]).should == [1]
  end

  it "should handle a two element array" do
    my_insertion_sort([2,1]).should == [1,2]
  end

  it "should handle a randomly sorted array" do
    my_insertion_sort([5,3,9,1,4,0,-3,-2,6]).should == [-3,-2,0,1,3,4,5,6,9]
  end

  it "should handle a reverse order array" do
    my_insertion_sort([9,8,7,6,5,4]).should == [4,5,6,7,8,9]
  end

  it "should handle an ordered array" do
    my_insertion_sort([1,2,3,4,5,6]).should == [1,2,3,4,5,6]
  end

  it "should handle duplicates" do
    my_insertion_sort([3,3,3,3,3]).should == [3,3,3,3,3]
  end

end