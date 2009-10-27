# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_contacts_session',
  :secret      => 'b8d791d6c9e1e35d292deaf8a5b3c2dd58cb3093b353aca5b4ec30cf955dbfb86bb305e8b8ff5dcef57c14e4ff3011a5430b3c3c5b44d35048a629422838f507'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
