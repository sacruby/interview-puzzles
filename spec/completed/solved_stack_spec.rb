describe "Stack" do

  class Stack
    class Element
      attr_accessor :value, :next, :previous
      def initialize(item)
        @value = item
        @next = nil
        @previous = nil
      end
    end

    def initialize
      @count = 0
      @current = nil
    end

    def push(val)
      return unless val
      element = Element.new(val)
      if @current.nil?
        @current = element
      else
        @current.next = element
        element.previous = @current
        @current = element
      end
      @count += 1
      val
    end

    def peek
      @current ? @current.value : nil
    end

    def size
      @count
    end

    def pop
      if @current
        element = @current
        if @current.previous
          @current.previous.next = nil
          @current = @current.previous
          @current.next = nil
        end
        @count -= 1
        element.value
      else
        nil
      end
    end

  end


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

  it "should empty stack with multiple items" do
    @stack.push(1)
    @stack.push(2)
    @stack.pop
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