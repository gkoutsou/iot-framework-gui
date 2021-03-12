OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :google_oauth2, '866433296305-g3ie9ep2pjfk2inqkbacohmqps8rticf.apps.googleusercontent.com', 'VEk944kf3skD8isQ6aHqMZcK'#, scope: 'email,profile'
end