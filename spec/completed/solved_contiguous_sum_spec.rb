describe "Contiguous Sum Finder" do
  before(:each) do
    @array_data = [2,-8,3,-2,4,-10]
  end 

  it "should find maximum sum subarray" do
    find_max_sum_subarray(@array_data).should == [3,-2,4]
  end

end