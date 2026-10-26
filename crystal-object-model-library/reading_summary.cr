module ReadingSummary
  abstract def title : String
  abstract def current_page : Int32
  abstract def total_pages : Int32

  def progress : String
    "#{@current_page}/#{@total_pages} pages"
  end
end
