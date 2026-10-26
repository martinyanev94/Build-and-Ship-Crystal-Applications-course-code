abstract class InventoryEntry
end

class BookRecord < InventoryEntry
end

class ArticleRecord < InventoryEntry
end

macro type_inventory
  [
    {% for type in InventoryEntry.all_subclasses %}
      {{type.name.stringify}},
    {% end %}
  ]
end

TYPE_NAMES = type_inventory

def print_inventory(names : Array(String))
  names.each do |name|
    puts "- #{name}"
  end
end

puts "Known inventory:"
print_inventory(TYPE_NAMES)
