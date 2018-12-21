class  Array
	def suma
		self.collect{|x| x.collect {|x| x.collect{|x| x.valorenergeticokcal.round(2)}}.reduce("+").reduce("+").round(3)}
	end
	
	def ordenar_for
		aux=self
		for i in 0..((self.count)-1)
			for j in i+1..self.count-1
				if aux.suma[i] > aux.suma[j]
					tmp=aux[i]
					aux[i]=aux[j]
					aux[j]=tmp
				end
			end
		end	
		aux			 
	end
	
	def ordenar_each
		aux=self
		aux.each do
			i=0 
			j=i+1
			if aux.suma[i] > aux.suma[j]
                                        tmp=aux[i]
                                        aux[i]=aux[j]
                                        aux[j]=aux       
		        end
			i=i+1
			j=j+1
		end
		aux
	end
end
