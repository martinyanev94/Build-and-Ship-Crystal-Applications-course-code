require "db"
require "pg"
require "../entities/article"

module Blog
  module Repositories
    class ArticleRepository
      def initialize(@database_url : String)
      end

      def find(id : Int32) : Blog::Entities::Article?
        article = nil
        DB.open @database_url do |db|
          db.query_one?(
            "SELECT id, title, body FROM articles WHERE id = $1",
            id,
            as: {Int32, String, String}
          ) do |row|
            article = Blog::Entities::Article.new(row[0], row[1], row[2])
          end
        end
        article
      end
    end
  end
end
