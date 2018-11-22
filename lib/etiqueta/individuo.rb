class Individuo 

	attr_reader :nombre, :edad, :sexo

	def initialize(nombre,edad,sexo) #sexo 0=femenino,1=masculino
		@nombre,@edad,@sexo=nombre,edad,sexo
	end	
end

class Paciente < Individuo
	def initialize(nombre,edad,sexo,peso,talla,cmcin,cmcad)
		super(nombre,edad,sexo)
		@peso=peso
		@talla=talla
		@cmcin=cmcin
		@cmcad=cmcad
	end
	
	def imc 
		(@peso/(@talla*@talla)).round(3)	
	end
end
