class Informacion_nutricional
	
	attr_reader :nombre, :grasasat, :grasam, :grasap, :hidratos, :azucares, :proteinas, :sal

	def initialize (nombre,grasasat,grasam,grasap,hidratos,azucares,proteinas,sal)
		@nombre,@grasasat,@grasam,@grasap,@hidratos,@azucares,@proteinas,@sal=nombre,grasasat,grasam,grasap,hidratos,azucares,proteinas,sal
	end		
	
	def grasas
		@grasasat+@grasam+@grasap
	end
	
	def valenkcalgrasas
		self.grasas*9
	end 

	def valenkjgrasas
		self.grasas*37
	end
	
	def valenkcalhidratos
		@hidratos*4
	end

	def valenkjhidratos
		@hidratos*17
	end
	
	def valenkcalproteinas
                @proteinas*4
        end

        def valenkjproteinas
                @proteinas*17
        end
	
	def valenkcalsal
                @sal*6
        end

        def valenkjsal
                @sal*25
        end	
	
	def valorenergeticokcal
		self.valenkcalgrasas+self.valenkcalhidratos+self.valenkcalsal+self.valenkcalproteinas
	end

	def valorenergeticokj
                self.valenkjgrasas+self.valenkjhidratos+self.valenkjsal+self.valenkjproteinas
        end
	
end

