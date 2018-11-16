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
		else
			n=Node.new(value,nil,@tail)
			@tail.next=n
			@tail=n
		end
	end
	
	def insert_head(value)	
		if self.is_empty
                        n=Node.new(value,nil,nil)
                        @head=n
                        @tail=n
                else
                        n=Node.new(value,@head,nil)
                        @head.prev=n
                        @head=n
                end


	end	
		
	def extrae_head
		if @head==@tail
			@head=nil
			@tail=nil
		else
			@head=@head.next
			@head.prev=nil
		end
	end
	
	  def extrae_tail
                if @head==@tail
                        @head=nil
                        @tail=nil
		end
         end
end
