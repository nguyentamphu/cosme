# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( sd-admin.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css)
Rails.application.config.assets.precompile += %w( font-awesome.css)

Rails.application.config.assets.precompile += %w( custom.css)
Rails.application.config.assets.precompile += %w( animate.css)
Rails.application.config.assets.precompile += %w( iview.css)
Rails.application.config.assets.precompile += %w( menu3d.css)
Rails.application.config.assets.precompile += %w( style-switch.css)
Rails.application.config.assets.precompile += %w( normalize.css)
Rails.application.config.assets.precompile += %w( color.css)
Rails.application.config.assets.precompile += %w( registration.css )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
