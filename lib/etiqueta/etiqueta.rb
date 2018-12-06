# encoding: utf-8
# Esta clase representa la información nutricional de una etiqueta alimenticia
# Hemos incluido el módulo Comparable
# Author::    Carolina Álvarez Martín  (mailto:alu0100944723@ull.edu.es)
# License::   Distributes under the same terms as Ruby
class Informacion_nutricional
	
	include Comparable	
	
	attr_reader :nombre, :grasasat, :grasam, :grasap, :hidratos, :azucares, :proteinas, :sal
	# Se inicializa la etiqueta
	def initialize (nombre,grasasat,grasam,grasap,hidratos,azucares,proteinas,sal)
		@nombre,@grasasat,@grasam,@grasap,@hidratos,@azucares,@proteinas,@sal=nombre,grasasat,grasam,grasap,hidratos,azucares,proteinas,sal
	end		
	# Cálculo de las grasas
	def grasas
		@grasasat+@grasam+@grasap
	end
	# Cálculo del valor energético de las grasas en Kcal
	def valenkcalgrasas
		self.grasas*9
	end 
	# Cálculo del valor energético de las grasas en Kj
	def valenkjgrasas
		self.grasas*37
	end
	# Cálculo del valor energético de los hidratos en Kcal
	def valenkcalhidratos
		@hidratos*4
	end
	# Cálculo del valor energético de los hidratos en Kj
	def valenkjhidratos
		@hidratos*17
	end
	# Cálculo del valor energético de las proteinas en Kcal
	def valenkcalproteinas
                @proteinas*4
        end
	# Cálculo del valor energético de las proteinas en Kj
        def valenkjproteinas
                @proteinas*17
        end
	# Cálculo del valor energético de la sal en Kcal
	def valenkcalsal
                @sal*6
        end
	# Cálculo del valor energético de la sal en Kj
        def valenkjsal
                @sal*25
        end	
	# Cálculo del valor energético total de la etiqueta en Kcal
	def valorenergeticokcal
		self.valenkcalgrasas+self.valenkcalhidratos+self.valenkcalsal+self.valenkcalproteinas
	end
	# Cálculo del valor energético total de la etiqueta en Kj
	def valorenergeticokj
                self.valenkjgrasas+self.valenkjhidratos+self.valenkjsal+self.valenkjproteinas
        end
	# Convierte en una Cadena nuestra etiqueta
	def to_s
		 "Valor Energético:\n kcal #{self.valorenergeticokcal} \n kj #{self.valorenergeticokj}\n_______________________\nGrasas #{self.grasas} \n de las cuales \n saturadas #{@grasasat} \n monoinsaturadas #{@grasam}\n poliinsaruradas #{@grasap}\n_______________________\nHidratos de carbono #{@hidratos}\n de los cuales \n azucares #{@azucares}\n_______________________\n proteinas #{@proteinas}\n_______________________\n sal #{@sal}\n_______________________\n "
	end
	# Método para poder utilizar el módulo comparable
	def <=>(etiqueta)
		self.valorenergeticokcal <=> etiqueta.valorenergeticokcal
	end
end
