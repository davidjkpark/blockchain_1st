class Dog

	def initialize
		@weight=0.5
	end

	def eat
		@weight=@weight+0.5
		puts @weight
	end

	def run
		puts "뛰자!!"
	end

end

aa= Dog.new
aa.eat
aa.eat
aa.run

bb=Dog.new
bb.eat
