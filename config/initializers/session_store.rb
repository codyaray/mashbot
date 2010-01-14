# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mashbot_session',
  :secret      => '784d4b6b5815e670f6cb987fc02c55dcbcab24bea8ea1c15fe9c33cdc9877d8ab9aefceade7aebc87aaa5769841a6d65b3bc172329fbfa4d924940a077bcf979'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
