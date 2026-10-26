require "json"

module Blog
  module Entities
    class Article
      include JSON::Serializable

      getter id : Int32
      getter title : String
      getter body : String

      def initialize(@id : Int32, @title : String, @body : String)
      end
    end
  end
end
