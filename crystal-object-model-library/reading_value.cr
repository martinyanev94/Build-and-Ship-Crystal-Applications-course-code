struct ReadingMark
  getter page

  def initialize(@page : Int32)
  end
end

class ValueShelf(T)
  def initialize
    @items = [] of T
  end

  def add(item : T) : Nil
    @items << item
  end

  def first : T?
    @items.first?
  end
end
