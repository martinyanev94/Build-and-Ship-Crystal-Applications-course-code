macro declaration_methods(decl)
  @{{decl.var}} : {{decl.type}}

  def {{decl.var}} : {{decl.type}}
    @{{decl.var}}
  end

  def {{decl.var}}=(value : {{decl.type}})
    @{{decl.var}} = value
  end

  def {{decl.var}}_label : String
    {{decl.var.stringify}}
  end
end

class Article
  declaration_methods title : String

  def initialize(@title : String)
  end
end

article = Article.new("Macros at Compile Time")
puts "title=#{article.title}"
puts "title_label=#{article.title_label}"
article.title = "Updated Macro Guide"
puts "title=#{article.title}"
