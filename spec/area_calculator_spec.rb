require 'area_calculator'
require 'area_calculator_rectangle'

describe "AreaCalculator circle area calculations" do
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
	end

	context "when testing circle area with invalid radius" do
		it "should raise exception for negative number" do
			expect { @areaCalc.circle(-2) }.to raise_error
		end

		it "should raise exception for invalid radius" do
			expect { @areaCalc.circle("3") }.to raise_error
		end
	end

	context "when area is manipulated" do
		it "should be greater than its half" do
			area = @areaCalc.circle(2)
			expect(@areaCalc.half(area)).to be < @areaCalc.circle(2)  
		end

		it "should be smaller than its double" do
			area = @areaCalc.circle(2)
			expect(@areaCalc.double(area)).to be > @areaCalc.circle(2)
		end
	end

	context "check the class type matcher" do
		it "areacalc should be instance of AreaCalculator" do
			expect(@areaCalc).to be_instance_of AreaCalculator
		end

		it "area should be kind of number" do
			expect(@areaCalc.circle(2)).to be_kind_of Numeric
		end
	end

end 

describe "AreaCalculatorRectangle area calculations" do
	# lets assume our AreaCalculator class depends on Rectangle class, Square class to calculate area for those
	context "when the valid length and breadth is provided" do 
		it "should return correct area" do
			rectangle1 = double('rectangle')
			allow(rectangle1).to receive(:length) { 2 }
			allow(rectangle1).to receive(:breadth) { 2 }

			areaCalc = AreaCalculatorRectangle.new(rectangle1)
			expect(areaCalc.rectangle).to eq 4			
		end
	end

end
