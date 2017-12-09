Ingrediente = Struct.new(:nombre, :porcion)

class Plato

attr_accessor :nombre, :vegetales, :frutas, :cereales, :proteinas, :aceites

  def initialize(nombre)	

	@nombre = nombre

	@vegetales = []	
	@frutas = []
	@cereales = []
	@proteinas = []
	@aceites = []

  end

end
