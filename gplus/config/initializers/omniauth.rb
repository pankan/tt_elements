OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '476602585408-3fiklaclekbinfmbd2lsdjcur1u21ril.apps.googleusercontent.com', 'RX-7Mq_SXT1DJSJsYJtLj6a4', scope: 'plus.login',
  access_type: 'offline',
  request_visible_actions: 'BuyActivity'
end