# encoding: utf-8

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter,       "JaE8SCtn5R5qNITANJPIjw",                   "UDCCYsA0WQPXxLFT2jFPNGVhr4YpwYeML9k3TRk"
  provider :facebook,      "578013189002983",                          "97e157f63782a2341aa8d025d8243100",       scope: "create_event,user_events,friends_events,publish_stream,user_birthday,read_friendlists"
  # provider :google_oauth2, "1046178131442.apps.googleusercontent.com", "jS2F9tJHOo2RcRAiZvH-mkbg"
end

# APP_ID = "452090888159529"
# APP_SECRET = "4e2ddd2159ed37a093054266b0a71d50"
# app = FbGraph::Application.new(APP_ID, secret: APP_SECRET)
# app.get_access_token

# access token get metho is written below url
# https://github.com/nov/fb_graph/wiki/App-Access-Token
FACEBOOK_ACCESS_TOKEN = "8895d341a245dc793024e7b8193ea07c"
