require "athena"
require "athena/negotiation"
require "athena/serializer"
require "pg"
require "crinja"

require "./config"
require "./entities/article"
require "./repositories/article_repository"

@[ATHA::Controller]
class WelcomeController
  include ATHA::Negotiation::Controller

  def initialize(@articles : Blog::Repositories::ArticleRepository)
  end

  @[ARTA::Post("/articles")]
  def create_article(request : ATH::Request) : Blog::Entities::Article
    if !(body = request.body) || body.peek.try &.empty?
      raise ATH::Exceptions::BadRequest.new "Request does not have a body."
    end

    Blog::Entities::Article.from_json body
  end

  @[ARTA::Get("/article/{id}")]
  def article(id : Int32) : Blog::Entities::Article
    article = @articles.find(id)
    raise ATH::Exceptions::NotFound.new "Article was not found." unless article
    article
  end
end

articles = Blog::Repositories::ArticleRepository.new(Blog::Config.database_url)
ATH.run WelcomeController.new(articles)
