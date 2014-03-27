module Inicio

  def palindromo?(cadena)
    temp1 = ""
    cont = 0
    # se coloca en temp1 solo las letras de la cadena
    while (cont < cadena.length)
      if(/[a-zA-Z]/.match(cadena[cont]))
        temp1 = temp1 + cadena[cont]
      end
      cont += 1
    end
    temp2 = ""
    cont -= 1
    # se coloca en temp2 las letras de la cadena en sentido contrario
    while (cont >= 0)
      if(/[a-zA-Z]/.match(cadena[cont]))
        temp2 = temp2 + cadena[cont]
      end
      cont -= 1
    end
    # si las letras de la cadena estan en la misma posicion que las letras en sentido contrario
    # entonces es un palindromo por lo que devuelve true, de lo contrario devuelve false
    if(temp1.upcase == temp2.upcase)
      true
    else
      false
    end
  end
  
  def cuenta_palabras(cadena)
    res = Hash.new
    array = Array.new
    temp = ""
    cont = 0
    cont_array = 0
    cont_palabra = 0
    i = j = 0
    # se guarda cada palabra de la cadena en una posicion de un arreglo
    while (cont < cadena.length)
      if(/\s/.match(cadena[cont]) && temp != "")
        array[cont_array] = temp
        cont_array += 1
        temp = ""
      else
        temp = temp + cadena[cont]
      end
      cont += 1
      if(cont == cadena.length && temp != "")
        array[cont_array] = temp
      end
    end
    # se cuenta cuantas veces esta la palabra en el arreglo
    # luego esta se agrega (como llave) junto con sus ocurrencias (como valor) al Hash
    # por ultimo se borra del arreglo junto con todas las palabras iguales a ella
    while (i < array.length)
      while(j < array.length)
        if(array[i] == array[j])
          cont_palabra += 1
        end
        j += 1
      end
      res[array[i]] = cont_palabra
      array.delete(array[i])
      cont_palabra = i = j = 0
    end
    # devuelve el hash
    res
  end
  
  def hanoi(numero_discos, t_origen, t_destino, t_alterna)
    if(numero_discos == 1)
      # imprime los movimientos
      puts "Mover disco de torre #{t_origen} a torre #{t_destino}"
    else
      # se hacen llamadas recursivas con numero_discos - 1 para hacer movimientos de solo 1 disco
      # se mueven los discos de la torre origen a la torre alterna
      hanoi(numero_discos-1,t_origen,t_alterna,t_destino)
      # la ultima ficha siempre ira de la torre origen a la torre destino
      hanoi(1,t_origen,t_destino,t_alterna)
      # finalmente se mueven los discos de la torre alterna a la torre destino
      hanoi(numero_discos-1,t_alterna,t_destino,t_origen)
    end
  end
  
  def sort(array, asc)
    res = Array.new
    strings = Array.new
    numeros = Array.new
    aux_n = Array.new
    aux_s = Array.new
    menor_n = mayor_n = 0
    menor_s = mayor_s = ""
    # separa el arreglo en dos, uno de solo numeros y otro de solo strings
    array.each do |i|
      if(/\d/.match(i.to_s))
        numeros.push(i)
      elsif(i != nil)
        strings.push(i)
      end
    end
    # [2, "avion", 10, "acelga", "dado", "celda", 3, 7, 4, 2]
    # ordena el arreglo de numeros
    if(numeros.length > 0)
      i = j = 0
      if(asc == true)
        while(i < numeros.length)
          menor_n = numeros[0]
          # encuentra el menor numero
          while(j < numeros.length)
            if(numeros[i] <= numeros[j])
              menor_n = numeros[i]
            else
              menor_n = numeros[j]
              i = j
            end
            j += 1
          end
          # agrega el menor numero a un arreglo auxiliar, si esta repetido agrega ambos numeros
          numeros.each do |n|
            if(n == menor_n)
              aux_n.push(menor_n)
            end
          end
          numeros.delete(menor_n)
          i = j = 0
        end
        # guarda en numeros el arreglo ya ordenado ascendentemente
        numeros = aux_n
      else
        while(i < numeros.length)
          mayor_n = numeros[0]
          # encuentra el mayor numero
          while(j < numeros.length)
            if(numeros[i] >= numeros[j])
              mayor_n = numeros[i]
            else
              mayor_n = numeros[j]
              i = j
            end
            j += 1
          end
          # agrega el mayor numero a un arreglo auxiliar, si esta repetido agrega ambos numeros
          numeros.each do |n|
            if(n == mayor_n)
              aux_n.push(mayor_n)
            end
          end
          numeros.delete(mayor_n)
          i = j = 0
        end
        # guarda en numeros el arreglo ya ordenado descendentemente
        numeros = aux_n
      end
    end
    # ordena el arreglo de strings
    if(strings.length > 0)
      i = j = 0
      if(asc == true)
        while(i < strings.length)
          menor_s = strings[0]
          # encuentra el menor string alfabeticamente
          while(j < strings.length)
            if(strings[i] <= strings[j])
              menor_s = strings[i]
            else
              menor_s = strings[j]
              i = j
            end
            j += 1
          end
          # agrega el menor string alfabeticamente a un arreglo auxiliar, si esta repetido agrega ambos strings
          strings.each do |n|
            if(n == menor_s)
              aux_s.push(menor_s)
            end
          end
          strings.delete(menor_s)
          i = j = 0
        end
        # guarda en strings el arreglo ya ordenado ascendentemente
        strings = aux_s
      else
        while(i < strings.length)
          mayor_s = strings[0]
          # encuentra el mayor string alfabeticamente
          while(j < strings.length)
            if(strings[i] >= strings[j])
              mayor_s = strings[i]
            else
              mayor_s = strings[j]
              i = j
            end
            j += 1
          end
          # agrega el mayor string alfabeticamente a un arreglo auxiliar, si esta repetido agrega ambos strings
          strings.each do |n|
            if(n == mayor_s)
              aux_s.push(mayor_s)
            end
          end
          strings.delete(mayor_s)
          i = j = 0
        end
        # guarda en numeros el arreglo ya ordenado descendentemente
        strings = aux_s
      end
    end
	# une los arreglos ordenados de numeros y strings
    numeros.each do |i| 
      res.push(i)
    end
    strings.each do |i|
      res.push(i)
    end
    # devuelve la copia ordenada del arreglo original
    res
  end
  
  def char_count(cadena, caracter)
    cont = res = 0
    # incrementa res cada vez que una caracter de la cadena es igual
    # al caracter deseado
    while(cont < cadena.length)
      if(cadena[cont] == caracter)
        res += 1
      end
      cont += 1
    end
    # devuelve la cantidad de ocurrencias del caracter en la cadena
    res
  end
  
  def atoi(cadena)
    cont = 0
    temp = temp2 = ""
    # deja la cadena solo con numeros, signos negativos (-) y puntos (.)
    while(cont < cadena.length)
      if(/-/.match(cadena[cont]) || /\./.match(cadena[cont]) || /\d/.match(cadena[cont]))
        temp = temp + cadena[cont]
      end
      cont += 1
    end
    if(temp[0] == "-")
      temp2 = "-"
    end
    # elimina los signos de mas
    temp2 = temp2 + temp.delete("-")
    # devuelve el numero entero
    temp2.to_i
  end
  
end