class  Array
	def suma
		self.collect{|x| x.collect {|x| x.collect{|x| x.valorenergeticokcal.round(2)}}.reduce("+").reduce("+").round(3)}
	end
	
	def ordenar_for
		for i in 0..((self.count)-1)
			for j in i+1..self.count-1
				if self.suma[i] > self.suma[j]
					aux=self[i]
					self[i]=self[j]
					self[j]=aux
				end
			end
		end	
		self			 
	end
end
