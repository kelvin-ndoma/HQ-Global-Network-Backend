if Rails.env == "production"
Rails.application.config.session_store :cookie_store, key: "_hq_global_network", domain: "hq-gn.com"
else 
    Rails.application.config.session_store :cookie_store, key: "_hq_global_network"
end