require 'etiqueta'

RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end
 
  it "Comprobar que existe la clase Informacion nutricional" do
    p=Informacion_nutricional.new()
  end

end
