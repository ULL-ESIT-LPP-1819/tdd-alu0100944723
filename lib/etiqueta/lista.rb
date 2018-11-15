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
	
	def insert_tail(value)
		if self.is_empty
			n=Node.new(value,nil,nil)
			@head=n
			@tail=n
		end
	end	
end
