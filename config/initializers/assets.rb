# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

%w(documents welcome).each do |controller|
  Rails.application.config.assets.precompile += ['#{controller}.js', '#{controller}.css']
end

Rails.application.config.assets.precompile += %w( documents.css )
Rails.application.config.assets.precompile += %w( documents.js )

Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( welcome.js )

Rails.application.config.assets.precompile += %w( teachers.css )
Rails.application.config.assets.precompile += %w( teachers.js )

Rails.application.config.assets.precompile += %w( navigation.css )
Rails.application.config.assets.precompile += %w( navigation.js )
