class Dessert
  
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def name
    @name
  end
  
  def size
    @size
  end
  
  def calories
    @calories
  end
  
  def name=(name)
    @name = name
  end
  
  def size=(size)
    @size = size
  end
  
  def calories=(calories)
    @calories = calories
  end
  
  def healthy?
    if(calories < 200)
      true
    else
      false
    end
  end
  
  def delicious?
    true
  end
  
  def to_s
    s = "nombre: #{name}, tamaño: #{size}, calorias: #{calories}"
  end
  
  def self.count
    count += 1
  end 
  
end