describe "towers of hanoi" do

  before(:each) do
    @stack1 = Stack.new
    @stack2 = Stack.new
    @stack3 = Stack.new

    @stack1.push(3)
    @stack1.push(2)
    @stack1.push(1)

    @game = Hanoi.new(@stack1, @stack2, @stack3)
  end

  it "should win the game" do
    @game.play
    @stack1.size.should == 0
    @stack2.size.should == 0
    @stack3.pop.should == 1
    @stack3.pop.should == 2
    @stack3.pop.should == 3
  end

  it "should make first move" do
    @game.step
    @stack1.size.should == 2
    @stack2.size.should == 0
    @stack3.size.should == 1
    @stack1.peek.should == 2
    @stack3.peek.should == 1
  end

  it "should make second move" do
    @game.step
    @game.step
    @stack1.size.should == 1
    @stack2.size.should == 1
    @stack3.size.should == 1
    @stack1.peek.should == 3
    @stack2.peek.should == 2
    @stack3.peek.should == 1
  end

end