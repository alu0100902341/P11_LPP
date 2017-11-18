class Alimento

attr_accessor :nombre, :proteinas, :glucidos, :lipidos, :kcal_

  def initialize(nombre, prot, glu, lip)	

	@nombre = nombre
	@proteinas = prot
	@glucidos = glu	
	@lipidos = lip
	@kcal_ = ( (4 * @proteinas) + (4 * @glucidos) + (9 * @lipidos) )

  end

  def to_s
	"#{@nombre} P(#{@proteinas}) G(#{@glucidos}) L(#{@lipidos})"
  end

end
