describe "Array Sorting" do

  it "should return an empty array" do
    my_insertion_sort([]).should == []
  end

  it "should handle a single element array" do
    my_insertion_sort([1]).should == [1]
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