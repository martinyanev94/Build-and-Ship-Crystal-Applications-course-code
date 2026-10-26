# A book that can be identified and measured by its page count.
class Book
  # The public title readers use to identify the book.
  getter title : String

  # The total number of pages in the book.
  getter pages : Int32

  # Creates a book with a title and a positive page count.
  def initialize(@title : String, @pages : Int32)
    raise ArgumentError.new("pages must be positive") if pages <= 0
  end
end

# A searchable collection of books.
class BookCatalog
  # The books currently stored in this catalog.
  getter books : Array(Book)

  # Creates a catalog from the supplied books.
  def initialize(@books : Array(Book) = [] of Book)
  end

  # Returns the number of books in the catalog.
  def size : Int32
    books.size
  end

  # Finds a book by title, or returns nil when no title matches.
  def find(title : String) : Book?
    books.find { |book| book.title == title }
  end
end
