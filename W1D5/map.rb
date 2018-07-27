
class Map

  attr_reader :map_array

  def initialize
    @map_array = []
  end

  def set(key,value)
    if key_index(key)
      map_array[key_index(key)][1] = value
      value
    else
      map_array.push [key,value]
      value
    end
  end

  def get(key)
    map_array[key_index(key)].last
  end

  def delete(key)
    map_array.delete_at(key_index(key))
  end

  def show
    self.map_array
  end

  def key_index(key)
    map_array.each.with_index do |arr,i|
      return i if arr.first == key
    end
    false
  end

end
