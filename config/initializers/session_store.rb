# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mashbot_session',
  :secret      => 'd54354be2db0f6ff997189155917bda03917110d37d940e8178c65060b4183e55eb54a8c4d647c698d4b2f434e673b55ddf9f268e9ab10cd6afe1402a17d3a5f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
