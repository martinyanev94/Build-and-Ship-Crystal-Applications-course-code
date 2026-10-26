macro validated_model(name, max_pages)
  {% unless max_pages.is_a?(NumberLiteral) %}
    {% raise "The page limit must be a numeric compile-time literal." %}
  {% end %}
  {% if max_pages.value > 400 %}
    {% raise "The page limit cannot exceed 400." %}
  {% end %}

  class {{name.id}}
    def self.max_pages : Int32
      {{max_pages}}
    end
  end
end
