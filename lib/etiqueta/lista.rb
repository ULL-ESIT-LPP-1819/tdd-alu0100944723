# encoding: utf-8
# Esta clase representa un nodo de nuestra lista
# Author::    Carolina Álvarez Martín  (mailto:alu0100944723@ull.edu.es)
# License::   Distributes under the same terms as Ruby

Node=Struct.new(:value,:next,:prev)
# encoding: utf-8
# Esta clase representa una lista doblemente enlazada
# Se ha incluido el modulo Enumerable
# Author::    Carolina Álvarez Martín  (mailto:alu0100944723@ull.edu.es)
# License::   Distributes under the same terms as Ruby

class Lista
		
	include Enumerable
	
	attr_reader :head, :tail, :salmenor6, :salmayor6, :bajo_peso, :adecuado, :sobrepeso, :obesidad_1, :obesidad_2, :obesidad_3
	# Inicializa la lista
	# En principio vacía
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
	# Método que devuelve true si la lista está vacía
	def is_empty?
		if @head==nil && @tail==nil
			true
		end
	end
	# Método para insertar desde la cola
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
	# Método para insertar por la cabeza
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
	# Método para extraer por la cabeza
	def extrae_head
		if @head==@tail
			@head=nil
			@tail=nil
		else
			@head=@head.next
			@head.prev=nil
		end
	end
	# Método para extraer por la cola
	  def extrae_tail
                if @head==@tail
                        @head=nil
                        @tail=nil
		else
                        @tail=@tail.prev
                        @tail.next=nil
                end

         end
	# Método que recorre una lista de etiquetas y clasifica según la sal
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
	# Método que recorre una lista de individuos y los clasifica según el imc
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
	# Método para poder usar la clase Enumerable, recorrre la lista
	def each
		head=@head
                while head!=nil
				yield head.value
				head=head.next		
		end
	end
end
