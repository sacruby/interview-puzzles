describe "Square Finder" do

  SQUARE_MATRIX = [
		[1,1,1,1,1,1,1,1,1,1],
		[1,0,0,0,1,0,0,0,0,0],
		[1,0,0,0,1,0,0,0,0,0],
		[1,0,0,0,1,0,0,0,0,0],
		[1,1,1,1,1,0,0,0,0,0],
		[0,0,0,1,1,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[1,1,1,1,1,1,1,1,1,1]]


  it "should return the top-left, width, and height of largest square" do
    square_finder(SQUARE_MATRIX).should == [[0,0],[5,5]]
  end

end