class JellyBean < Dessert
  
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  def flavor
    @flavor = flavor
  end
  
  def flavor=(flavor)
    @flavor = flavor
  end
  
  def delicious?
    if((flavor) != "black licorice")
      true
    else
      false
    end
  end
  
end