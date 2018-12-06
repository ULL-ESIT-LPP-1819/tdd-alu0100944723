Node=Struct.new(:value,:next,:prev)

class Lista
		
	include Enumerable
	
	attr_reader :head, :tail, :salmenor6, :salmayor6, :bajo_peso, :adecuado, :sobrepeso, :obesidad_1, :obesidad_2, :obesidad_3
	def initialize
		@head=nil
		@tail=nil
		@salmenor6=Array.new
		@salmayor6=Array.new
		@bajo_peso=Array.new
		@adecuado=Array.new
		@sobrepeso=Array.new
		@obesidad_1=Array.new
		@obesidad_2=Array.new
		@obesidad_3=Array.new
	end
	
	def is_empty?
		if @head==nil && @tail==nil
			true
		end
	end
	
	def insert_tail(value)
		if self.is_empty?
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
		if self.is_empty?
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
		else
                        @tail=@tail.prev
                        @tail.next=nil
                end

         end
	
	def recorrer_sal
		while self.is_empty?!=true
			if @head.value.sal>6.0
				@salmayor6 << (@head.value)
				self.extrae_head
			else
				@salmenor6 << (@head.value)
				self.extrae_head
			end
		end
			
	end
	
	def recorrer_imc
 		while self.is_empty?!=true
 			if @head.value.imc<18.4
 				@bajo_peso << (@head.value)
 				self.extrae_head
			elsif @head.value.imc>18.5 && @head.value.imc<24.9
 				@adecuado << (@head.value)
				 self.extrae_head
			elsif @head.value.imc>25.5 && @head.value.imc<29.9
                                @sobrepeso << (@head.value)
                                 self.extrae_head
			elsif @head.value.imc>30.0 && @head.value.imc<34.9
                                @obesidad_1 << (@head.value)
                                 self.extrae_head
			elsif @head.value.imc>35.0 && @head.value.imc<39.9
                                @obesidad_2 << (@head.value)
                                 self.extrae_head
			elsif @head.value.imc>40.0
                                @obesidad_3 << (@head.value)
                                 self.extrae_head

 			end
		 end

	end
	
	def each
		head=@head
                while head!=nil
				yield head.value
				head=head.next		
		end
	end
end
