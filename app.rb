require 'bundler'
Bundler.require

class App < Roda
  plugin :assets, css: ['tailwind.out.css'], css_opts: {style: :compressed, cache: false}, timestamp_paths: true
  compile_assets if ENV['RACK_ENV'] == 'production'
  plugin :render, escape: true, layout: './layout'

  route do |r|
    r.assets
    r.root do
      view "index"
    end
  end
end
