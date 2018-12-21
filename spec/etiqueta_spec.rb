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
	@p1=Paciente.new("Lara",27,0,50,1.69,62,65,0)
	@p2=Paciente.new("CLara",35,0,60,1.50,62,65,1)
	@p3=Paciente.new("Mario",16,1,60,1.68,62,65,2)
 	@p4=Paciente.new("Sara",23,0,80,1.60,62,65,3)
 	@p5=Paciente.new("Paula",25,0,110,1.70,62,65,0)
 	@p6=Paciente.new("Juan",28,1,120,1.70,62,65,1)
	@p7=Paciente.new("Pedro",26,1,60,1.70,62,65,2)
	@p8=Paciente.new("Maria",29,0,70,1.64,62,65,3)	

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
			p=Paciente.new("Lara",22,0,50,1.69,62,65,0)
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
	
        describe "Debe calcularse el gasto energético total para los individuos" do
                it "Probando que existe el peso teórico ideal" do
                        expect(@p1.peso_teorico_ideal).to eq(64.25)
		end
	
		it "Probando que existe el gasto energético basal" do
			expect(@p1.gasto_energetico_basal).to eq(1260.25)
			expect(@p3.gasto_energetico_basal).to eq(1575)
		end
		
		it "Probando que existe el efecto termógeno" do
			expect(@p1.efecto_termogeno).to eq(126.025)
		end
		
		it "Probando que existe el gasto_actividad_fisica" do
			expect(@p2.nivel_actividad).to eq(1)
			expect(@p2.factor_actividad).to eq(0.12)
			expect(@p3.gasto_actividad_fisica).to eq(425.25)
		end
		
		it "Probando el gasto energético total" do
			expect(@p1.gasto_energetico_total).to eq(1386.275)
		end
	end

end

RSpec.describe "Utilizando los modulos" do
	
        before :each do
		@e4=Informacion_nutricional.new("producto4",1.2,1.4,0.2,6.7,6.7,2.6,7.3)
                @e3=Informacion_nutricional.new("producto3",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
                @e2=Informacion_nutricional.new("producto2",1.2,1.4,0.2,6.7,6.7,2.6,8.0)
                @e1=Informacion_nutricional.new("producto1",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
		@p1=Paciente.new("Lara",27,0,50,1.69,62,65,0)
        	@p2=Paciente.new("CLara",35,0,60,1.50,62,65,1)
        	@p3=Paciente.new("Mario",16,1,60,1.68,62,65,2)
        	@p4=Paciente.new("Sara",23,0,80,1.60,62,65,3)
		@l=Lista.new
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
		
		it "Comparaciones entre individuos" do
			expect(@p2>@p1).to eq(true)
                        expect(@p1<@p3).to eq(true)
                        expect(@p1==@p1).to eq(true)
                        expect(@p4>=@p2).to eq(true)
                        expect(@p2<=@p2).to eq(true)
                        expect(@p2.between?(@p1,@p3)).to eq(true)
		end
	end
	
	context "Enumerable" do
		it "Lista enumerable" do
			@l.insert_tail(1)
			@l.insert_tail(2)
			@l.insert_tail(4)
			@l.insert_tail(3)
			@l.insert_tail(5)
			expect(@l.collect {|x| x}).to eq([1,2,4,3,5])
			expect(@l.select {|i| i<=2}).to eq([1,2])
			expect(@l.max).to eq(5)
			expect(@l.min).to eq(1)
			expect(@l.sort).to eq([1,2,3,4,5])
		end
	
		it "Lista de etiquetas enumerable" do
			@l.insert_tail(@e1)
			@l.insert_tail(@e2)
			@l.insert_tail(@e4)
			expect(@l.collect {|x| x.nombre}).to eq(["producto1","producto2","producto4"])
                        expect(@l.select {|i| i.nombre=="producto4"}).to eq([@e4])
                        expect(@l.max).to eq(@e1)
                        expect(@l.min).to eq(@e4)
                        expect(@l.sort).to eq([@e4,@e2,@e1])
		end
		
		it "Lista de individuos enumerable" do
		        @l.insert_tail(@p1)
                        @l.insert_tail(@p2)
			@l.insert_tail(@p3)	
                        @l.insert_tail(@p4)
                        expect(@l.collect {|x| x.imc}).to eq([17.506,26.667,21.259,31.25])
                        expect(@l.select {|i| i.imc.between?(18.5,24.9)}).to eq([@p3])
                        expect(@l.max).to eq(@p4)
                        expect(@l.min).to eq(@p1)
                        expect(@l.sort).to eq([@p1,@p2,@p3,@p4])
	
		end
	end
end

RSpec.describe "Haciendo menús" do
		
	before :each do
		@e5=Informacion_nutricional.new("producto5",0,0,0,25.0,25.0,0,0.08)
                @e4=Informacion_nutricional.new("producto4",7.0,4.0,4.8,40,1,9.4,2)
                @e3=Informacion_nutricional.new("producto3",0.34,0.20,0.40,4.0,1,9.4,1.1)
                @e2=Informacion_nutricional.new("producto2",4.0,2.0,1.0,46,36,4,0.9)
                @e1=Informacion_nutricional.new("producto1",0.5,0.5,0.4,30,0,0,0.08)
		@e6=Informacion_nutricional.new("producto6",0.2,0.1,0.2,0,8.8,5.1,0.07)
                @e7=Informacion_nutricional.new("producto7",5.9,4.2,3.1,62.3,2.0,11.0,1.75)
                @e8=Informacion_nutricional.new("producto8",0.1,0.2,0.1,0,0,12.0,2)
                @e9=Informacion_nutricional.new("producto9",2.7,2.0,1.2,62.0,32.0,7.0,0.9)
                @e10=Informacion_nutricional.new("producto10",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
		@e11=Informacion_nutricional.new("producto11",1.2,1.4,0.2,6.7,6.7,2.6,1.2)
                @e12=Informacion_nutricional.new("producto12",1.2,1.4,0.2,6.7,6.7,2.6,3.50)
                @e13=Informacion_nutricional.new("producto13",1.2,1.4,0.2,6.7,6.7,2.6,6.8)
                @e14=Informacion_nutricional.new("producto14",1.2,1.4,0.2,6.7,6.7,2.6,8.0)
                @e15=Informacion_nutricional.new("producto15",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
		@p1=Paciente.new("Lara",27,0,50,1.69,62,65,0)
	        @p2=Paciente.new("CLara",35,0,60,1.50,62,65,1)
       		@p3=Paciente.new("Mario",16,1,60,1.68,62,65,2)
        	@p4=Paciente.new("Sara",23,0,80,1.60,62,65,3)
        	@p5=Paciente.new("Paula",25,0,110,1.70,62,65,0)
        	@p6=Paciente.new("Juan",28,1,120,1.70,62,65,1)

		
	end

	it "Creando y asignando menús" do
	menu1=[[@e1,@e2],[@e3,@e4,@e5],[@e6,@e7,@e8,@e9]]
	menu2=[[@e14,@e13,@e12,@e11],[@e6,@e7,@e8],[@e9,@e10]]
	menu3=[[@e15,@e1,@e2],[@e3,@e4],[@e7,@e8,@e9,@e2]]
	menu4=[[@e2,@e3,@e1],[@e15,@e14,@e13,@e12],[@e11,@e1]]
	individuo=[@p1,@p2,@p3,@p4,@p5,@p6]
	sum1=menu1.collect {|x| x.collect{|x| x.valorenergeticokcal}}.reduce("+").reduce("+")
	sum2=menu2.collect {|x| x.collect{|x| x.valorenergeticokcal}}.reduce("+").reduce("+")
	sum3=menu3.collect {|x| x.collect{|x| x.valorenergeticokcal}}.reduce("+").reduce("+")
	sum4=menu4.collect {|x| x.collect{|x| x.valorenergeticokcal}}.reduce("+").reduce("+")
	expect(sum1.round(3)).to eq(1768.340)
	expect(sum2.round(3)).to eq(1330.72)
	expect(sum3.round(3)).to eq(2029.14)
	expect(sum4.round(3)).to eq(1088.02)
	margen1=sum1*0.1
	margen2=sum2*0.1
	margen3=sum3*0.1
	margen4=sum4*0.1
	expect((margen1-sum1)<=(individuo[0].gasto_energetico_total) && (individuo[0].gasto_energetico_total)<=(margen1+sum1)).to eq(true)
	expect((margen3-sum3)<=(individuo[1].gasto_energetico_total) && (individuo[1].gasto_energetico_total)<=(margen3+sum3)).to eq(true)
	expect((margen2-sum2)<=(individuo[2].gasto_energetico_total) && (individuo[2].gasto_energetico_total)<=(margen2+sum2)).to eq(false)
	expect((margen4-sum4)<=(individuo[3].gasto_energetico_total) && (individuo[3].gasto_energetico_total)<=(margen4+sum4)).to eq(false)
	expect((margen2-sum2)<=(individuo[4].gasto_energetico_total) && (individuo[4].gasto_energetico_total)<=(margen2+sum2)).to eq(false)
	expect((margen1-sum1)<=(individuo[5].gasto_energetico_total) && (individuo[5].gasto_energetico_total)<=(margen1+sum1)).to eq(false)		
	end
end

RSpec.describe "Ordenando vectores y listas" do
	before :all do

   		@e5=Informacion_nutricional.new("producto5",0,0,0,25.0,25.0,0,0.08)
                @e4=Informacion_nutricional.new("producto4",7.0,4.0,4.8,40,1,9.4,2)
                @e3=Informacion_nutricional.new("producto3",0.34,0.20,0.40,4.0,1,9.4,1.1)
                @e2=Informacion_nutricional.new("producto2",4.0,2.0,1.0,46,36,4,0.9)
                @e1=Informacion_nutricional.new("producto1",0.5,0.5,0.4,30,0,0,0.08)
                @e6=Informacion_nutricional.new("producto6",0.2,0.1,0.2,0,8.8,5.1,0.07)
                @e7=Informacion_nutricional.new("producto7",5.9,4.2,3.1,62.3,2.0,11.0,1.75)
                @e8=Informacion_nutricional.new("producto8",0.1,0.2,0.1,0,0,12.0,2)
                @e9=Informacion_nutricional.new("producto9",2.7,2.0,1.2,62.0,32.0,7.0,0.9)
                @e10=Informacion_nutricional.new("producto10",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
                @e11=Informacion_nutricional.new("producto11",1.2,1.4,0.2,6.7,6.7,2.6,1.2)
                @e12=Informacion_nutricional.new("producto12",1.2,1.4,0.2,6.7,6.7,2.6,3.50)
                @e13=Informacion_nutricional.new("producto13",1.2,1.4,0.2,6.7,6.7,2.6,6.8)
                @e14=Informacion_nutricional.new("producto14",1.2,1.4,0.2,6.7,6.7,2.6,8.0)
                @e15=Informacion_nutricional.new("producto15",1.2,1.4,0.2,6.7,6.7,2.6,9.3)
                @p1=Paciente.new("Lara",27,0,50,1.69,62,65,0)
                @p2=Paciente.new("CLara",35,0,60,1.50,62,65,1)
                @p3=Paciente.new("Mario",16,1,60,1.68,62,65,2)
                @p4=Paciente.new("Sara",23,0,80,1.60,62,65,3)
                @p5=Paciente.new("Paula",25,0,110,1.70,62,65,0)
		@p6=Paciente.new("Juan",28,1,120,1.70,62,65,1)
        	@p7=Paciente.new("Pedro",26,1,60,1.70,62,65,2)
        	@p8=Paciente.new("Maria",29,0,70,1.64,62,65,3)
		@p9=Paciente.new("Luis",26,1,55,1.52,62,65,2)
                @p10=Paciente.new("Sergio",30,1,80,1.68,79,80,0)		
	end
	
	it "Array de menús" do
		menu1=[[@e1,@e2],[@e3,@e4,@e5],[@e6,@e7,@e8,@e9]]
       		menu2=[[@e14,@e13,@e12,@e11],[@e6,@e7,@e8],[@e9,@e10]]
        	menu3=[[@e15,@e1,@e2],[@e3,@e4],[@e7,@e8,@e9,@e2]]
        	menu4=[[@e2,@e3,@e1],[@e15,@e14,@e13,@e12],[@e11,@e1]]
		menu5=[[@e3,@e2],[@e2,@e4,@e5],[@e1,@e7,@e3,@e9]]
       	 	menu6=[[@e14,@e15,@e12,@e9],[@e6,@e7,@e5],[@e4,@e10]]
        	menu7=[[@e15,@e3,@e2],[@e5,@e4],[@e7,@e10,@e9,@e2]]
        	menu8=[[@e11,@e3,@e1],[@e15,@e8,@e13,@e12],[@e11,@e9]]
        	menu9=[[@e1,@e3],[@e3,@e4,@e15],[@e6,@e7,@e8,@e10]]
        	menu10=[[@e12,@e13,@e9,@e11],[@e6,@e11,@e8],[@e9,@e3]]
        	menus=[menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8,menu9,menu10]
		expect(menus.suma).to eq([1768.34, 1330.72, 2029.14, 1088.02, 2016.48, 1664.8, 2051.14, 1043.84, 1370.02, 1152.38])
		expect(menus.ordenar_for).to eq ([menu8,menu4,menu10,menu2,menu9,menu6,menu1,menu5,menu3,menu7])
		expect(menus.ordenar_each).to eq ([menu8,menu4,menu10,menu2,menu9,menu6,menu1,menu5,menu3,menu7])
	end
	
	it "Lista de individuos" do
		individuos=Lista.new
		individuos.insert_head(@p1)
		individuos.insert_tail(@p2)
		individuos.insert_tail(@p3)
		individuos.insert_tail(@p4)
		individuos.insert_tail(@p5)
		individuos.insert_tail(@p6)
                individuos.insert_tail(@p7)
                individuos.insert_tail(@p8)
                individuos.insert_tail(@p9)
                individuos.insert_tail(@p10)
		expect(individuos.ordenar_for).to eq([@p1,@p2,@p10,@p9,@p5,@p7,@p3,@p8,@p4,@p6])
	end		
end





