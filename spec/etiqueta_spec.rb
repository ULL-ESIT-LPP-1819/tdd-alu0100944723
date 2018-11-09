require 'etiqueta'

RSpec.describe Etiqueta do
	
	before :each do
		@e=Informacion_nutricional.new("producto",1.2,1.4,0.2,6.7,6.7,2.6,0.18)
	end

	it "has a version number" do
		expect(Etiqueta::VERSION).not_to be nil
	end

describe "Comprobando el constructor de la etiqueta" do 

	it "Existe un nombre para la etiqueta y la cantidad de grasas saturadas,monoinsaturadas y poliinsaturadas.Existen la cantidad de hidratos de carbono, azucares,proteinas y sal" do
		p=Informacion_nutricional.new("producto",1.2,1.4,0.2,6.7,6.7,2.6,0.18)
	end
end

describe "Comprobando los accesos" do
	it "Se almacena correctamente el nombre de la etiqueta" do
		expect(@e.nombre).to eq("producto")
	end
end

end

