describe "Stack" do

  before(:each) do
    @stack = Stack.new
  end

  it "should push to the stack" do
    @stack.push(1)
    @stack.size.should == 1
  end

  it "should pop top value on stack" do
    @stack.push(2)
    @stack.push(1)
    @stack.pop.should == 1
  end

  it "should empty stack" do
    @stack.push(1)
    @stack.pop
    @stack.size.should == 0
  end

  it "should be an empty stack" do
    @stack.size.should == 0
  end

  it "should not push nil as a valid value" do
    @stack.push(nil)
    @stack.size.should == 0
  end

  it "should return nothing if stack is empty" do
    @stack.pop.should be_nil
    @stack.size.should == 0
  end

  it "should show top element without removing" do
    @stack.push(1)
    @stack.peek.should == 1
    @stack.size.should == 1
  end

end