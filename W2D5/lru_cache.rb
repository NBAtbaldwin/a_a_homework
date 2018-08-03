class LRUCache
  def initialize(size = 5)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    delete!(el) if include?(el)
    @cache.push(el)
    @cache.shift if count > @size
    el
  end

  def show
    puts "#{@cache}"
  end

  private

  def include?(input)
    @cache.include?(input)
  end

  def delete!(input)
    @cache.delete_at(@cache.index(input))
  end
end
