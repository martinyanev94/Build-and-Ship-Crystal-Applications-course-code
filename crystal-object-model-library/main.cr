require "./book"
require "./reading_value"

book = Book.new("Crystal Patterns", 4)
book.read_to 4
puts "Reading #{book.current_page} of #{book.total_pages} pages"

begin
  book.read_to 5
rescue error : ReadingLimitError
  puts error.message
end

puts "Book remains at page #{book.current_page}."

mark = ReadingMark.new(book.current_page)
shelf = ValueShelf(ReadingMark).new
shelf.add(mark)
puts "Saved mark at page #{shelf.first.not_nil!.page}."
