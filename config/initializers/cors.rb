# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV["CORS_ALLOWED_ORIGIN"] || "http://localhost:4200"
    resource "*",
      headers: [ "Content-Type", "Authorization" ],
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
  end
end
