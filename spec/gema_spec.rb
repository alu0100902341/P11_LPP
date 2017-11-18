require "spec_helper"

RSpec.describe Gema do
  it "has a version number" do
    expect(Gema::VERSION).not_to be nil
  end

  describe Alimento do

	before :each do

		@nutrientes = [ Alimento.new("Huevo frito", 14.1, 0.0, 19.5), Alimento.new("Leche de vaca", 3.3, 4.8, 3.2), Alimento.new("Yogurt", 3.8, 4.9, 3.8), Alimento.new("Cerdo", 21.5, 0.0, 6.3), Alimento.new("Ternera", 21.1, 0.0, 3.1), Alimento.new("Pollo", 20.6, 0.0, 5.6), Alimento.new("Bacalao", 17.7, 0.0, 0.4), Alimento.new("Atún", 21.5, 0.0, 15.5), Alimento.new("Salmón", 19.9, 0.0, 13.6), Alimento.new("Aceite de oliva", 0.0, 0.2, 99.6), Alimento.new("Chocolate", 5.3, 47.0, 30.0), Alimento.new("Azúcar", 0.0, 99.8, 0.0), Alimento.new("Arroz", 6.8, 77.7, 0.6), Alimento.new("Lentejas", 23.5, 52.0, 1.4), Alimento.new("Papas", 2.0, 15.4, 0.1), Alimento.new("Tomate", 1.0, 3.5, 0.2), Alimento.new("Cebolla", 1.3, 5.8, 0.3), Alimento.new("Manzana", 0.3, 12.4, 0.4), Alimento.new("Plátanos", 1.2, 21.4, 0.2) 		
				]	

	end

	it "Método para obtener el nombre del alimento." do
	   expect(@nutrientes[0].nombre).to eq("Huevo frito")
	 end

	it "Método para obtener la proteína de un alimento." do
	   expect(@nutrientes[0].proteinas).to eq(14.1)
	 end

	it "Método para obtener los glúcidos de un alimento." do
	   expect(@nutrientes[0].glucidos).to eq(0.0)
	 end

	it "Método para obtener los lípidos de un alimento." do
	   expect(@nutrientes[0].lipidos).to eq(19.5)
	 end

	it "Método para obtener un alimento formateado." do
	   expect(@nutrientes[0].to_s).to eq("Huevo frito P(14.1) G(0.0) L(19.5)")
	 end

	it "Método para obtener las Kcal de un alimento." do
	   expect(@nutrientes[0].kcal_).to eq(231.9)
	 end

  end

  describe Lista do

  	before :each do

		@lista_dl = Lista.new
		@lista_dl.push_back(1)
		@lista_dl.push_back(2)
		@lista_dl.push_back(3)
		@lista_dl.push_back(4)

		@lista_dl_alimentos = Lista.new
		@lista_dl_alimentos.push_back(Grupo_alimento.new( "Huevos, lácteos y helados", ["Huevo frito", 14.1, 0.0, 19.5] )) #kcal = 231,9
		@lista_dl_alimentos.push_back(Grupo_alimento.new( "Huevos, lácteos y helados", ["Leche de vaca", 3.3, 4.8, 3.2] )) #kcal = 61,2
		@lista_dl_alimentos.push_back(Grupo_alimento.new( "Carnes y derivados','Pescados y mariscos", ["Bacalao", 17.7, 0.0, 0.4] )) #kcal = 74,4

		@array_alimentos = [ Grupo_alimento.new( "Huevos, lácteos y helados", ["Huevo frito", 14.1, 0.0, 19.5] ), Grupo_alimento.new( "Huevos, lácteos y helados", ["Leche de vaca", 3.3, 4.8, 3.2] ), Grupo_alimento.new( "Carnes y derivados','Pescados y mariscos", ["Bacalao", 17.7, 0.0, 0.4] ) ] 


  	end

	it "Debe existir un nodo con su valor." do
	   expect(@lista_dl.head.value).to eq(1)
	 end

	it "Debe existir un nodo con su siguiente." do
	   expect(@lista_dl.head.next.value).to eq(2)
	 end

	it "Debe existir un nodo con su previo." do
	   expect(@lista_dl.tail.prev.value).to eq(3)
	 end

	it "Debe existir una lista con su cabeza y su cola." do
	   expect(@lista_dl.head.value).to eq(1)
	   expect(@lista_dl.tail.value).to eq(4)
	 end

	it "Se puede insertar un elemento en la Lista." do
	   @lista_dl.push_back(5)
	   expect(@lista_dl.tail.value).to eq(5)
	 end

	it "Se puede extraer el primer elemento de la lista." do
	   expect(@lista_dl.pop_front).to eq(1)
	 end

	it "Se puede extraer el último elemento de la lista." do
	   expect(@lista_dl.pop).to eq(4)
	 end


#Enumerable ------------------------------------------------------------------------------------------------------------

	it "comprobrando el metodo all?" do
	   expect(@lista_dl_alimentos.all?).to eq(true)
	end 

	it "comprobrando el metodo any?" do
	   expect(@lista_dl_alimentos.any?).to eq(true)
	end 

	it "comprobrando el metodo collect" do
	   expect(@lista_dl_alimentos.map{|i| i}).to eq(@array_alimentos)
	end

	it "comprobrando el metodo count" do
	   expect(@lista_dl_alimentos.count).to eq(3)
	end

	it "comprobrando el metodo detect" do
	   expect(@lista_dl_alimentos.detect{|i| i == Grupo_alimento.new( "Huevos, lácteos y helados", ["Leche de vaca", 3.3, 4.8, 3.2] )}).to eq(Grupo_alimento.new( "Huevos, lácteos y helados", ["Leche de vaca", 3.3, 4.8, 3.2] ))
	end

	it "comprobrando el metodo drop" do
	   #@lista_aux = Lista.new
	   #@lista_aux.push_back(4)
	   #expect(@lista_dl_alimentos.drop(Grupo_alimento.new( "Huevos, lácteos y helados", ["Leche de vaca", 3.3, 4.8, 3.2] ))).to eq([Grupo_alimento.new( "Carnes y derivados','Pescados y mariscos", ["Bacalao", 17.7, 0.0, 0.4] )])
	    expect(@lista_dl.drop(3)).to eq([4])
	end


	it "comprobrando el metodo max" do
	   expect(@lista_dl_alimentos.max{|a,b| a <=> b}).to eq(Grupo_alimento.new( "Huevos, lácteos y helados", ["Huevo frito", 14.1, 0.0, 19.5] ))
	end

	it "comprobrando el metodo min" do
	   expect(@lista_dl_alimentos.min{|a,b| a <=> b}).to eq(Grupo_alimento.new( "Huevos, lácteos y helados", ["Leche de vaca", 3.3, 4.8, 3.2] ))
	end

	it "comprobrando el metodo sort" do
	   @array_ordenado_alimentos = [ Grupo_alimento.new( "Huevos, lácteos y helados", ["Leche de vaca", 3.3, 4.8, 3.2] ), Grupo_alimento.new( "Carnes y derivados','Pescados y mariscos", ["Bacalao", 17.7, 0.0, 0.4] ), Grupo_alimento.new( "Huevos, lácteos y helados", ["Huevo frito", 14.1, 0.0, 19.5] ) ]
	   expect(@lista_dl_alimentos.sort).to eq(@array_ordenado_alimentos)
	end


  end

  describe Grupo_alimento do

	before :each do

		@alimento1 = Grupo_alimento.new( "Huevos, lácteos y helados", ["Huevo frito", 14.1, 0.0, 19.5] )	#kcal = 231,9
		@alimento2 = Grupo_alimento.new( "Huevos, lácteos y helados", ["Leche de vaca", 3.3, 4.8, 3.2] )	#kcal = 61,2
		@alimento3 = Grupo_alimento.new( "Carnes y derivados','Pescados y mariscos", ["Bacalao", 17.7, 0.0, 0.4] )	#kcal = 74,4
	end

	it "Comprobar pertenencia a las clases." do
	   expect(@alimento1.class).to eq(Grupo_alimento)
	 end

	it "Comprobar tipo de dato." do
	   expect(@alimento1.is_a? Grupo_alimento).to eq(true)
	 end

	it "Comprobar pertenencia a jerarquía." do
	   expect(@alimento1.class.superclass).to eq(Alimento)
	 end

# P8 ---------------------------------------------------------------------------------------------------- Comparable

	it "Comprobar igualdad alimento1 consigo mismo." do
	   expect(@alimento1 == @alimento1).to eq(true)
	 end

	it "Comprobar igualdad alimento1 con alimento2." do
	   expect(@alimento3 == @alimento2).to eq(false)
	 end

	it "Comprobar alimento3 < alimento1." do
	   expect(@alimento3 < @alimento1).to eq(true)
	 end

	it "Comprobación alimento3 > alimento2." do
	   expect(@alimento3 > @alimento2).to eq(true)
	 end

	it "Comprobar alimento3 <= alimento1." do
	   expect(@alimento3 <= @alimento1).to eq(true)
	 end

	it "Comprobación alimento3 >= alimento2." do
	   expect(@alimento3 >= @alimento2).to eq(true)
	 end

	
	it "Comprobación alimento2 >= alimento1." do
	   expect(@alimento2 >= @alimento1).to eq(false) 
	 end

  end

# P9 ------------------------------------------------------------------------------------------------------- Programación funcional

  describe Ig do

	before :each do
	
		@glucosa_antes_ingesta = [ 
                  [ 4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1 ],
		  [6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5 ]
                ]

		@g_compota = [ 
			[ 6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9 ],
			[ 4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9 ] 
		]

		@g_yogur = [ 
			[ 6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4 ],
			[ 4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9, 5.9, 5.8, 5.8, 5.5, 5.5, 5.6, 5.9, 5.9 ] 
		]

		@g_chocolate = [ 
			[ 6.5, 6.5, 6.7, 6.5, 6.5, 6.8, 6.7, 6.2, 6.5, 7.2, 6.9, 7.0, 6.3, 6.2, 6.1, 5.9, 5.8, 6.1, 6.7, 6.7, 6.6, 6.7, 6.9, 7.2, 7.1 ],
			[ 4.6, 4.6, 4.7, 4.7, 4.8, 4.7, 4.8, 4.8, 4.6, 4.4, 4.7, 4.7, 4.8, 4.7, 5.2, 5.9, 5.9, 5.7, 5.4, 5.3, 5.1, 4.8, 4.8, 4.9, 5.9 ] 
		]

		@ig_compota = Ig.new("Compota", @g_compota, @glucosa_antes_ingesta)
		@ig_yogur = Ig.new("Yogur", @g_yogur, @glucosa_antes_ingesta)
		@ig_chocolate = Ig.new("Chocolate", @g_chocolate, @glucosa_antes_ingesta)
	end

	it "Posee los atributos nombre, array_glucosa_alimento, array_glucosa" do
		expect(@ig_compota.nombre_alimento).to eq("Compota")
		expect(@ig_compota.array_glucosa_alimento).to eq(@g_compota)
		expect(@ig_compota.array_glucosa_antes).to eq(@glucosa_antes_ingesta)
	end

	ig "IG de los distintos alimentos" do
		expect(@ig_compota.calc_ig).to eq(51.95881131329113)
		expect(@ig_yogur.calc_ig).to eq(41.1668067642405)
		expect(@ig_chocolate.calc_ig).to eq(15.752571202531657)
	end

  end


end
