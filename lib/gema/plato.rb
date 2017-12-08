class Plato

attr_accessor :nombre, :vegetales, :frutas, :cereales, :proteinas, :aceites

  def initialize(nombre)	

	@nombre = nombre

	@vegetales = Hash.new	
	@frutas = Hash.new
	@cereales = Hash.new
	@proteinas = Hash.new
	@aceites = Hash.new

  end

end
