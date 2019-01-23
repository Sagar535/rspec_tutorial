PI = 3.1415

class AreaCalculator
	def circle(radius)
		if radius >= 0
			PI*radius*radius
		else 
			raise StandardError
		end
	end

	def double(area)
		area*2
	end

	def half(area)
		area/2
	end
end
