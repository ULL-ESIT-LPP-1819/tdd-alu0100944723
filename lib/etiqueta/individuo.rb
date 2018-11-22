class Individuo 

	attr_reader :nombre, :edad, :sexo

	def initialize(nombre,edad,sexo) #sexo 0=femenino,1=masculino
		@nombre,@edad,@sexo=nombre,edad,sexo
	end	
end

class Paciente < Individuo
	def initialize(nombre,edad,sexo)
		super(nombre,edad,sexo)
	end
end
