if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, 
      key: "_hq_global_network", 
      domain: "hq-gn.com", 
      secure: true, # Ensures cookies are sent over HTTPS only
      httponly: true, # Prevents JavaScript access to cookies
      same_site: :strict # Prevents CSRF by restricting cross-origin requests
  else
    Rails.application.config.session_store :cookie_store, 
      key: "_hq_global_network"
  end
  