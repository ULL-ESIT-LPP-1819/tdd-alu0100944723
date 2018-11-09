class Informacion_nutricional
	
	attr_reader :nombre

	def initialize (nombre,grasasat,grasam,grasap,hidratos,azucares,proteinas,sal)
		@nombre,@grasasat,@grasam,@grasap,@hidratos,@azucares,@proteinas,@sal=nombre,grasasat,grasam,grasap,hidratos,azucares,proteinas,sal
	end		
end

