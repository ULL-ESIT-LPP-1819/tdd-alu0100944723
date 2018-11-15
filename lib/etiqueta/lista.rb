Node=Struct.new(:value,:next,:prev)

class Lista
	attr_reader :head, :tail
	def initialize
		@head=nil
		@tail=nil
	end
	
	def is_empty 
		if @head==nil && @tail==nil
			true
		end
	end
	
end
