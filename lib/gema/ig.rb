
class Ig
include Enumerable
attr_reader :nombre_alimento, :array_glucosa_alimento, :array_glucosa_antes
	def initialize(nombre, glucosa_al, glucosa_antes)

		@nombre_alimento = nombre
		@array_glucosa_alimento = glucosa_al
		@array_glucosa_antes = glucosa_antes

	end

# collects == map, devuelve un nuevo array. Each devuelve self. Ninguno modifica el array original al aplicarle el bloque a.collect {|x| x + "!"}
# reduce acumula todos los elementos según una operación y devuelve el valor nuevo (5..10).reduce(:+) // 45
# combina los elementos en pos i de varios arrays y crea un array con ellos a = [1,2] y b = [3,4] [5,6].zip(a,b) // [ [5,1,3],[6,2,4] ] 
	def indice
		
		# >> [ [ @array_glucosa_alimento[0], @array_glucosa_antes[0] ], ...   ]
		individuo = @array_glucosa_alimento.zip(@array_glucosa_antes)

		indices = individuo.collect do |a|

			g0a = a[0][0]
			aux1 = a[0].each_with_index.collect do |x, index|				
				
				if x > g0a
					g1 = x - g0a
				else
					g1 = 0

				end
				
				if index > 0
					if a[0][index] > g0a					
						g2 = a[0][index-1] - g0a
					else
						g2 = 0
					end	
				else
					g2 = 0
				end
				#puts "#{((g1 + g2)/2)*5}"
				((g1 + g2)/2)*5
			end
			
			
			aibc_a = aux1.reduce(:+)
			
			g0g = a[1][0]
			aux2 = a[1].each_with_index.collect do |x, index| 

				if x > a[1][0]
					g1 = x - g0g
				else
					g1 = 0

				end
				
				if index > 0
					if a[1][index] > g0g					
						g2 = a[1][index-1] - g0g
					else
						g2 = 0
					end	
				else
					g2 = 0
				end
				#puts "#{((g1 + g2)/2)*5}"
				((g1 + g2)/2)*5
			end

			aibc_g = aux2.reduce(:+)
			ig = (aibc_a / aibc_g) * 100
			

		end

		ig_all = indices.reduce(:+)
		return ig_all/@array_glucosa_alimento.size

	end

end
