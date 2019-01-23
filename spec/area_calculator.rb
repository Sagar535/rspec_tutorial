PI = 3.1415

class AreaCalculator
	def circle(radius)
		if radius >= 0
			PI*radius*radius
		else 
			raise StandardError
		end
	end
end

describe AreaCalculator do
	before(:each) do 
		@areaCalc = AreaCalculator.new
	end

	context "When testing the circle's area with valid radius" do
		it "should return correct for integer params" do
			circle_area = @areaCalc.circle(2)
			expect(circle_area.floor).to eq 12
		end

		it "should return correct for the floating point number" do
			area = @areaCalc.circle(2.2)
			expect(area.floor).to eq 15
		end

		it "should return zero for radius equal zero" do
			area = @areaCalc.circle(0)
			expect(area.floor).to eq 0
		end

		it "should raise exception for negative number" do
			expect { @areaCalc.circle(-2) }.to raise_error
		end

		it "should raise exception for invalid radius" do
			expect { @areaCalc.circle("3") }.to raise_error
		end
	end
end