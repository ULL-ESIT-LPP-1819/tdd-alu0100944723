require 'etiqueta'

RSpec.describe Etiqueta do
	
	before :each do		
		@e=Informacion_nutricional.new("producto",1.2,1.4,0.2,6.7,6.7,2.6,0.18)
                @e5=Informacion_nutricional.new("producto5",1.2,1.4,0.2,6.7,6.7,2.6,1.2)
                @e4=Informacion_nutricional.new("producto4",1.2,1.4,0.2,6.7,6.7,2.6,3.50)
                @e3=Informacion_nutricional.new("producto3",1.2,1.4,0.2,6.7,6.7,2.6,6.8)
                @e2=Informacion_nutricional.new("producto2",1.2,1.4,0.2,6.7,6.7,2.6,8.0)
                @e1=Informacion_nutricional.new("producto1",1.2,1.4,0.2,6.7,6.7,2.6,9.3)

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
	before :each do
		@l=Lista.new
		@e5=Informacion_nutricional.new("producto5",1.2,1.4,0.2,6.7,6.7,2.6,1.2)
		@e4=Informacion_nutricional.new("producto4",1.2,1.4,0.2,6.7,6.7,2.6,3.50)
		@e3=Informacion_nutricional.new("producto3",1.2,1.4,0.2,6.7,6.7,2.6,6.8)
		@e2=Informacion_nutricional.new("producto2",1.2,1.4,0.2,6.7,6.7,2.6,8.0)
		@e1=Informacion_nutricional.new("producto1",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
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
	describe "Probando la lista" do
		it "Debe existir un método que compruebe si la lista está vacía" do
			expect(@l.is_empty?).to eq(true)
		end
		
		it "Debe insertarse un nodo correctamente por la cola si la lista está vacía" do
			@l.insert_tail(5)
			expect(@l.head.value).to eq(5)
			expect(@l.head.next).to eq(nil)
			expect(@l.head.prev).to eq(nil)
			expect(@l.tail.value).to eq(5)
                        expect(@l.tail.next).to eq(nil)
                        expect(@l.tail.prev).to eq(nil)

		end
		
		it "Debe insertarse un nodo correctamente por la cola si la lista no está vacía" do
			@l.insert_tail(3)
			 n=Node.new(4,nil,@l.tail)
			@l.insert_tail(4)	
			expect(@l.head.next).to eq(n)
			expect(@l.tail).to eq(n)
		end
		it "Debe insertarse un nodo correctamente por el head si la cola está vacía" do
			 @l.insert_head(5)
                        expect(@l.head.value).to eq(5)
                        expect(@l.head.next).to eq(nil)
                        expect(@l.head.prev).to eq(nil)
                        expect(@l.tail.value).to eq(5)
                        expect(@l.tail.next).to eq(nil)
                        expect(@l.tail.prev).to eq(nil)

		end
	        it "Debe insertarse un nodo correctamente por la cabecera si la lista no está vacía" do
                        @l.insert_head(3)
                         n=Node.new(4,@l.head,nil)
                        @l.insert_head(4)
                        expect(@l.tail.prev).to eq(n)
                        expect(@l.head).to eq(n)
                end
		
		it "Debe extraerse un nodo correctamente por la cabecera si la lista sólo tiene un elemento" do
			@l.insert_head(4)
			@l.extrae_head
			expect(@l.is_empty?).to eq(true)
		end
		 it "Debe extraerse un nodo correctamente por la cabecera si la lista tiene más de un elemento" do
                        @l.insert_head(4)
			n=Node.new(4,nil,nil)
			@l.insert_head(6)
                        @l.extrae_head
                        expect(@l.head).to eq(n)
			expect(@l.head.prev).to eq(nil)
                end

	        it "Debe extraerse un nodo correctamente por la cola si la lista sólo tiene un elemento" do
                        @l.insert_tail(4)
                        @l.extrae_tail
                        expect(@l.is_empty?).to eq(true)
                end
		
		  it "Debe extraerse un nodo correctamente por la cabecera si la lista tiene más de un elemento" do
                        @l.insert_tail(4)
                        n=Node.new(4,nil,nil)
                        @l.insert_tail(6)
                        @l.extrae_tail
                        expect(@l.tail).to eq(n)
                        expect(@l.tail.next).to eq(nil)
                end		
	end	


	describe "Probando la lista con etiquetas" do
		it "Clasificando según la sal" do
			@l.insert_tail(@e1)
			@l.insert_tail(@e2)
			@l.insert_tail(@e3)
			@l.insert_tail(@e4)
			@l.insert_tail(@e5)
			@l.recorrer_sal
			expect(@l.salmenor6).to eq([@e4,@e5])
			expect(@l.salmayor6).to eq([@e1,@e2,@e3])
		end
	end	
end

RSpec.describe Individuo do
	  before :each do
                @i=Individuo.new("Clara",25,0)
        end
	
	describe "Pruebas basicas de los individuos" do
		it"Probando el initialize de los individuos" do
			i=Individuo.new("Clara",25,0)
		end
		it"Probando los getters" do
			expect(@i.nombre).to eq("Clara")
			expect(@i.edad).to eq(25)
			expect(@i.sexo).to eq(0)
		end
		it"Probando cuál es la clase de un individuo" do
			expect(@i.class).to eq(Individuo)
			expect(Individuo.class).to eq(Class)
		end
		
		it"Debe existir el método to_s" do
			expect(@i.to_s).to eq("Nombre:Clara,Edad:25,Sexo:0") 
		end
	end
end

RSpec.describe Paciente do

	before :each do
	
	@l=Lista.new
	@p1=Paciente.new("Lara",27,0,50,1.69,62,65)
	@p2=Paciente.new("CLara",35,0,60,1.50,62,65)
	@p3=Paciente.new("Mario",16,1,60,1.68,62,65)
 	@p4=Paciente.new("Sara",23,0,80,1.60,62,65)
 	@p5=Paciente.new("Paula",25,0,110,1.70,62,65)
 	@p6=Paciente.new("Juan",28,1,120,1.70,62,65)
	@p7=Paciente.new("Pedro",26,1,60,1.70,62,65)
	@p8=Paciente.new("Maria",29,0,70,1.64,62,65)	

        end

	
	describe  "Probando la jerarquía de clases" do
		it"Individuo es superclase de Paciente" do
			expect(Paciente.superclass).to eq(Individuo)
		end
	
		it"Object es superclase de Individuo" do
			 expect(Individuo.superclass).to eq(Object)
		end
		
		it"BasicObject es es superclase de Object" do
			expect(Object.superclass).to eq(BasicObject)
		end
		it"Probando la clase y el tipo de un objeto" do
			
			expect(@p1.class).to eq(Paciente)#La clase de un objeto es única
			expect(@p1.is_a?Individuo).to eq(true)#Puede ser de muchos tipos
			expect(@p1.is_a?Paciente).to eq(true)
			expect(@p1.is_a?BasicObject).to eq(true)
			expect(@p1.kind_of?Paciente).to eq(true)
			expect(@p1.kind_of?Individuo).to eq(true)
			expect(@p1.kind_of?BasicObject).to eq(true)
			expect(@p1.respond_to?:imc).to eq(true)
			
		end
	end	
	
	describe "Probando el initialize" do
		it "Paciente tiene que tener un nombre, una edad y un sexo, debe tener también las medidas antropométricas tomadas" do
			p=Paciente.new("Lara",22,0,50,1.69,62,65)
		end		
	end
	
        describe "Clasificando por el imc" do
                it "Debe existir un metodo para calcular el imc" do
                        expect(@p1.imc).to eq(17.506)
                end
		it "Debe existir un metodo para clasificar individuos por imc en una lista" do
			@l.insert_tail(@p1)
                        @l.insert_tail(@p2)
                        @l.insert_tail(@p3)
                        @l.insert_tail(@p4)
                        @l.insert_tail(@p5) 
			@l.insert_tail(@p6)
                        @l.insert_tail(@p7)
                        @l.insert_tail(@p8)
                        @l.recorrer_imc
                        expect(@l.bajo_peso).to eq([@p1])
                        expect(@l.adecuado).to eq([@p3,@p7])
			expect(@l.sobrepeso).to eq([@p2,@p8])
			expect(@l.obesidad_1).to eq([@p4])
			expect(@l.obesidad_2).to eq([@p5])
			expect(@l.obesidad_3).to eq([@p6])

		end
        end	
	describe "Probando el to_s" do
		it "Debe existir el metodo to_s para los pacientes" do
			expect(@p1.to_s).to eq("Nombre:Lara,Edad:27,Sexo:0,Peso:50,Talla:1.69,Cintura:62,Cadera:65")
		end

	end
end

RSpec.describe "Utilizando los modulos" do
	
        before :each do
		@e4=Informacion_nutricional.new("producto3",1.2,1.4,0.2,6.7,6.7,2.6,7.3)
                @e3=Informacion_nutricional.new("producto3",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
                @e2=Informacion_nutricional.new("producto2",1.2,1.4,0.2,6.7,6.7,2.6,8.0)
                @e1=Informacion_nutricional.new("producto1",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
        end
	context "Comparable" do
		it "Comparaciones entre etiquetas" do
                	expect(@e1>@e2).to eq(true)
			expect(@e2<@e1).to eq(true)
			expect(@e1==@e3).to eq(true)
			expect(@e1>=@e2).to eq(true)
			expect(@e1<=@e3).to eq(true)
			expect(@e2.between?(@e4,@e1)).to eq(true)
		end
	end
end
