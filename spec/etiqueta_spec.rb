require "lib/etiqueta/etiqueta"

RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end 
  it "Comprobar que existe la clase etiqueta" do
    p=Etiqueta.new
  end

end
