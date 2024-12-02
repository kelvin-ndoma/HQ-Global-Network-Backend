# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://127.0.0.1:5173'  # Specify the origin of your frontend (React app)
    
    resource '*', 
      headers: :any, 
      methods: [:get, :post, :put, :patch, :delete, :options, :head], 
      credentials: true  # Allow cookies to be sent with requests
  end
end
