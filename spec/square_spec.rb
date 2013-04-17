describe "Square Finder" do

	def square_finder(matrix)

		# Check for nil matrix
		return if matrix.nil?

 		# Check for non-array matrix
		return unless matrix.is_a? Array

		size = matrix.size

		# Check for any non-array elements
		return if matrix.index{|r| !r.is_a? Array}

		# Check for non-square matrix
		return if matrix.index{|r| r.length != size}

		# Check for bad values
		return if matrix.index{|r| r.index{|c| c != 0 && c != 1}}

		max_origin = nil
		max_size = 0

		# Loop through all rows
		(0...size).each do |r|

			# If we already have a square that is larger than the number of rows REMAINING, then bail
			break if (size - r) <= max_size

			(0...size).each do |c|

				# If we already have a square that is larger than the number of columns REMAINING, then bail
				break if (size - c) <= max_size

				# If this particular origin is 1, then we look for a square
				if matrix[r][c] == 1

					# Walk the top and left sides as far as we can
					(1...(size - [r,c].max)).each do |tl|

            # If we find a hole, then we've gone as far as we can on the top and left, check bottom and right
						if matrix[r][c+tl] != 1 || matrix[r+tl][c] != 1

              # If the possible size of the square is larger than our current maximum, then keep working
							if tl > max_size

                # Try largest and then scale back to see if we can find a complete square
                tl.downto(max_size + 1) do |s|

                  # Then walk to bottom and right sides to make sure it is closed
  								if !(1...s).to_a.index{|br| matrix[r+br][c+s-1] != 1 || matrix[r+s-1][c+br] != 1}

                    # We have a largest square, remember it
  									max_origin = [c,r]
  									max_size = s

                    # We're done
                    break
  								end
                end
							end

              # We're done
							break
						end
					end
				end
			end
		end

    # If no square found, then bail
		return if max_size == 0

		[max_origin, max_size]
	end

  it "should return nil if the matrix is nil" do
  	square_finder(nil).should be_nil
  end

  it "should return nil if the matrix is not an array" do
  	square_finder(0).should be_nil
  end

  it "should return nil if the matrix is not an array of arrays" do
  	square_finder([0]).should be_nil
  end

  it "should return nil if the matrix is not square" do
  	square_finder([[0, 0]]).should be_nil
  	square_finder([[0],[0]]).should be_nil
  end

  it "should return nil if the matrix contains invalid values (not 0 or 1)" do
  	square_finder([[nil,0],[0,0]]).should be_nil
  	square_finder([[0,true],[0,0]]).should be_nil
  	square_finder([[0,0],[[],0]]).should be_nil
  	square_finder([[0,0],[0,2]]).should be_nil
  end

  it "should return [[0,0],5]" do
    square_finder([
			[1,1,1,1,1,1,1,1,1,1],
			[1,0,0,0,1,0,0,0,0,0],
			[1,0,0,0,1,0,0,0,0,0],
			[1,0,0,0,1,0,0,0,0,0],
			[1,1,1,1,1,0,0,0,0,0],
			[0,0,0,1,1,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[1,1,1,1,1,1,1,1,1,1]]).should == [[0,0],5]
  end

  it "should return [[3,4],2]" do
    square_finder([
			[1,1,0,1,1,1,1,1,1,1],
			[1,0,0,0,1,0,0,0,0,0],
			[1,0,0,0,1,0,0,0,0,0],
			[1,0,0,0,1,0,0,0,0,0],
			[1,1,1,1,1,0,0,0,0,0],
			[0,0,0,1,1,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[1,1,1,1,1,1,1,1,1,1]]).should == [[3,4],2]
  end

  it "should return [[0,0],1]" do
    square_finder([
			[1,1,0,1,1,1,1,1,1,1],
			[1,0,0,0,1,0,0,0,0,0],
			[1,0,0,0,1,0,0,0,0,0],
			[1,0,0,0,1,0,0,0,0,0],
			[1,1,1,0,1,0,0,0,0,0],
			[0,0,0,1,1,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[1,1,1,1,1,1,1,1,1,1]]).should == [[0,0],1]
  end

  it "should return nil due to no square" do
    square_finder([
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0]]).should be_nil
  end
end
