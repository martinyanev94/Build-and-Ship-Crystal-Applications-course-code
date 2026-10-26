class ReadingProgress
  getter completed_pages, total_pages

  def initialize(@total_pages : Int32)
    raise ArgumentError.new("total pages must be positive") if total_pages <= 0
    @completed_pages = 0
  end

  def advance(pages : Int32) : Nil
    raise ArgumentError.new("pages cannot be negative") if pages < 0

    new_total = @completed_pages + pages
    raise ArgumentError.new("cannot pass total pages") if new_total > @total_pages

    @completed_pages = new_total
  end

  def percentage : Float64
    (@completed_pages.to_f / @total_pages) * 100
  end
end
