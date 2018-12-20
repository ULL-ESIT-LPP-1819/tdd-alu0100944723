class  Array
	def suma	
		self.collect{|x| x.collect {|x| x.collect{|x| x.valorenergeticokcal.round(2)}}.reduce("+").reduce("+").round(3)}
	end

end
