#클래스!! 클래스란 무엇인가!!
class Puppy
	def initialize
		@hungry=true
	end
#여기까지 이니셜라이즈는 모든 클래스에 반드시 존재
	def feed
		puts "배불러유"
	end

	def run
		puts "다리아파요"
	end

	def walk
		puts "집가고싶어요"
	end

	def coding
		puts "아싸!!!"
	end

	def bite

	end

	def jumpoo

	end
end

aa=Puppy.new
puts aa