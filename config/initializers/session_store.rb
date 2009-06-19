# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_assotemplate2_session',
  :secret      => '6bc2e984edad6148beedcb22333438d819fff823ac74f0837c29d286784301b0edf50fed796d6734f7986d8ebf272b33b6bb0b3a3d0c60df97e2f748dd60c42b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
