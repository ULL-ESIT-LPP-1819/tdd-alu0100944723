require 'etiqueta'

RSpec.describe Etiqueta do
	
	it "has a version number" do
		expect(Etiqueta::VERSION).not_to be nil
	end

describe "Comprobando el constructor de la etiqueta" do 

	it "Existe un nombre para la etiqueta y la cantidad de grasas saturadas,monoinsaturadas y poliinsaturadas" do
		p=Informacion_nutricional.new("producto",1.2,1.4,0.2)
	end
end
 
end
