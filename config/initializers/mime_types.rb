# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

if Rack::Utils.respond_to?("key_space_limit=")
  Rack::Utils.key_space_limit = 262144
end