require "./reading_summary"

class ReadingLimitError < Exception
  def initialize(page : Int32, total_pages : Int32, title : String)
    super("Cannot read to page #{page}: book \"#{title}\" has only #{total_pages} pages")
  end
end

class Book
  include ReadingSummary

  getter title
  getter total_pages
  getter current_page

  def initialize(@title : String, @total_pages : Int32)
    @current_page = 0
  end

  def read_to(page : Int32) : Nil
    if page > @total_pages
      raise ReadingLimitError.new(page, @total_pages, @title)
    end
    @current_page = page
  end
end

class Ebook < Book
  getter format

  def initialize(title : String, total_pages : Int32, @format : String)
    super(title, total_pages)
  end
end
