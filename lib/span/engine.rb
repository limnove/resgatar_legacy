# lib/span/engine.rb

module Span
  class Engine < ::Rails::Engine
    isolate_namespace Span

    # Custom template engine
    config.generators do |g|
      g.template_engine :haml
      g.test_framework nil
      g.assets false
      g.stylesheets false
      g.javascripts false
    end

    # Add migrations to parent paths
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    # sets the manifests / assets to be precompiled, even when initialize_on_precompile is false
    initializer "span.assets.precompile", group: :all do |app|
      app.config.assets.paths << "#{Rails.root}/app/assets/*"
      app.config.assets.paths << "#{Rails.root}/app/assets/**/*"
      app.config.assets.paths << "#{Rails.root}/app/assets/***/**/*"
      app.config.assets.paths << "#{Rails.root}/app/assets/****/***/**/*"
      app.config.assets.paths << "#{Rails.root}/app/assets/fonts/span/*"
      app.config.assets.paths << "#{Rails.root}/app/assets/fonts/span/**/*"
      app.config.assets.paths << "#{Rails.root}/app/assets/images/span/*"
      app.config.assets.paths << "#{Rails.root}/app/assets/images/span/**/*"
      app.config.assets.precompile << /\.(?:ico|gif|png|jpg|jpeg|svg|eot|woff|ttf)$/
    end
  end
end
