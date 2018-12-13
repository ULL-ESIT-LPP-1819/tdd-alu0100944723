# encoding: utf-8
# Esta clase representa la información sobre un individuo
# Author::    Carolina Álvarez Martín  (mailto:alu0100944723@ull.edu.es)
# License::   Distributes under the same terms as Ruby
class Individuo
	
	attr_reader :nombre, :edad, :sexo
	
	# Se asignan los datos a un individuo
	def initialize(nombre,edad,sexo) #sexo 0=femenino,1=masculino
		@nombre,@edad,@sexo=nombre,edad,sexo
	end
	# Convierte en cadena los datos de un individuo
	def to_s
		"Nombre:#{@nombre},Edad:#{@edad},Sexo:#{@sexo}"
	end	
end
# Esta clase representa la valoración nutricional de un Paciente
# Hereda de Individuo
# Author::  Carolina Álvarez Martín  (mailto:alu0100944723@ull.edu.es)
class Paciente < Individuo
		
	include Comparable
	# Se asignan los datos de un paciente
	def initialize(nombre,edad,sexo,peso,talla,cmcin,cmcad)
		super(nombre,edad,sexo)
		@peso=peso
		@talla=talla
		@cmcin=cmcin
		@cmcad=cmcad
	end
	# Calcula el imc de un paciente
	def imc 
		(@peso/(@talla*@talla)).round(3)	
	end
	# Convierte en cadena los datos de un paciente
	def to_s
	s=""
	s << super.to_s
	s << ",Peso:#{@peso},Talla:#{@talla},Cintura:#{@cmcin},Cadera:#{@cmcad}"
	end
	# Método para poder utilizar el módulo comparable
	def <=> (individuo)
		self.imc<=>individuo.imc
	end
	
	# Método que calcula el peso teórico ideal
	def peso_teorico_ideal
		((@talla*100)-150)*0.75+50
	end
	
	# Método que calcula el gasto energético basal
	def gasto_energetico_basal
		if @sexo==0
			(10*@peso)+(6.25*@talla*100)-(5*@edad)-161
		else
			(10*@peso)+(6.25*@talla*100)-(5*@edad)+5
		end
	end
end
	
