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
	
	it "Se almacena correctamente las grasas(poliinsaturadas,monoinsaturadas y saturadas" do
		expect(@e.grasasat).to eq(1.2)
		expect(@e.grasam).to eq(1.4)
		expect(@e.grasap).to eq(0.2)
	end
	it "Se almacenan correctamente los hidratos de carbono" do
		expect(@e.hidratos).to eq(6.7)
	end
	
	it "Se almacenan correctamente los azucares" do
		expect(@e.azucares).to eq(6.7)
	end
	
	it "Se almacenan correctamente las proteinas" do
		expect(@e.proteinas).to eq(2.6)
	end
	
	it "Se almacena correctamente la sal" do
		expect(@e.sal).to eq(0.18)
	end
end

describe "Calculo del las grasas" do
	
	it "Las grasas se calculan bien" do
		expect(@e.grasas).to eq(2.8)
	end
end

describe "Calculo del Valor energético" do
	it "En kcal" do
		expect(@e.valenkcalgrasas).to eq(25.2)
		expect(@e.valenkcalhidratos).to eq(26.8)
		expect(@e.valenkcalproteinas).to eq(10.4)
		expect(@e.valenkcalsal).to eq(1.08)
	end
	it "En kj" do
		expect(@e.valenkjgrasas).to eq(103.6)
		expect(@e.valenkjhidratos).to eq(113.9)
		expect(@e.valenkjproteinas).to eq(44.2)	
		expect(@e.valenkjsal).to eq(4.5)	
	end

end
describe "Calculo del valor energético total" do
	it "En kcal" do
		expect(@e.valorenergeticokcal).to eq(63.48)
	end
	
	it "En kj" do
		expect(@e.valorenergeticokj).to eq(266.2)
	end
end
describe "Prueba de obtencion de la salida formateada" do
	
	it "La salida se muestra correctamente" do
		expect(@e.to_s).to eq( "Valor Energético:\n kcal 63.48 \n kj 266.2\n_______________________\nGrasas 2.8 \n de las cuales \n saturadas 1.2 \n monoinsaturadas 1.4\n poliinsaruradas 0.2\n_______________________\nHidratos de carbono 6.7\n de los cuales \n azucares 6.7\n_______________________\n proteinas 2.6\n_______________________\n sal 0.18\n_______________________\n ")
	end 
end
end
RSpec.describe Node do
	it "Debe existir un nodo" do
		n=Node.new
	end
end

RSpec.describe Lista do
	before :all do
		@l=Lista.new
	end

	describe "Probando el initialize" do
		it "Debe existir una  Lista" do
			l1=Lista.new
		end

		
		it "Deben crearse las variables @head y @tail" do
			expect(@l.head).to eq(nil)
			expect(@l.tail).to eq(nil)
		end	
	end
end
