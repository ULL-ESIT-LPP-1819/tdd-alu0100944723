require 'etiqueta'

RSpec.describe Etiqueta do

  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end
 
  it "Existe un nombre para la etiqueta" do
    p=Informacion_nutricional.new("producto")
  end

  it "Existe la cantidad de grasas" do
	p=Informacion_nutricional.new("producto",3.2)
  end
 
end
