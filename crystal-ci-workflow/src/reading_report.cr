struct ReadingReport
  def initialize(@title : String, @pages_read : Int32, @total_pages : Int32)
  end

  def completion : Float64
    @pages_read.to_f / @total_pages * 100
  end

  def summary : String
    "#{@title}: #{completion.round(1)}% complete"
  end
end
