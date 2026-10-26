module Blog
  module Config
    def self.database_url : String
      ENV.fetch("DATABASE_URL")
    end
  end
end
