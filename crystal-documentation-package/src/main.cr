require "./reading_library"

books = [
  Book.new("Crystal in Action", 320),
  Book.new("Systems Notes", 180),
]

catalog = BookCatalog.new(books)

puts "Reading #{catalog.size} books"
puts catalog.find("Crystal in Action").not_nil!.title
