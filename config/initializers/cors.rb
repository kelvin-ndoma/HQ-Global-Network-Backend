Rails.application.config.middleware.insert_before 0, Rack::Cors do
    # localhost
    allow do
      origins "http://localhost:5173"
      resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
    # domain used
    # allow do
    #   origins "http://localhost:5173"
    #   resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    # end
  end
  