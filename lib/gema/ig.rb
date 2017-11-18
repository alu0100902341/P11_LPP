
class Ig
attr_reader :nombre_alimento, :array_glucosa_alimento, :array_glucosa_antes
	def initialize(nombre, glucosa_al, glucosa_antes)

		@nombre_alimento = nombre
		@array_glucosa_alimento = glucosa_al
		@array_glucosa_antes = glucosa_antes

	end

end
