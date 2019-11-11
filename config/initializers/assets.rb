# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path


Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.paths << Rails.root.join('node_modules/@fortawesome/fontawesome-free/')
Rails.application.config.assets.paths << Rails.root.join('node_modules/chosen-js/')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( webfonts/fa-solid-900.eot webfonts/fa-solid-900.svg webfonts/fa-solid-900.ttf chosen-sprite.png )

