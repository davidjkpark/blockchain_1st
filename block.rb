class Blockchain

	def mining
		begin
			nonce =rand(10)
		end while nonce !=0
		nonce
	end

	def transaction

		"거래완료!"
	end


end
