annotation Register; end

class Registry
  @@entries = {} of String => String

  def self.add(path : String, type_name : String)
    @@entries[path] = type_name
  end

  def self.entries
    @@entries
  end
end

macro finished
  {% registration = @type.annotation(Register) %}
  {% if registration %}
    Registry.add({{registration[:path]}}, {{@type.stringify}})
  {% end %}
end

@[Register(path: "/books")]
class BookHandler
end

@[Register(path: "/articles")]
class ArticleHandler
end

puts Registry.entries.to_a.sort_by(&.[0]).map { |entry| "#{entry[0]} -> #{entry[1]}" }.join("\n")
