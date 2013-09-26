###
# Blog settings
###

Time.zone = "Jakarta"

activate :livereload

activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = ":title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  blog.taglink = "tags/:tag.html"
  # blog.starlink = "stars/:star.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.star_template = "star.html"
  blog.calendar_template = "calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  # deploy.remote = "custom-remote" # remote name or git url, default: origin
  deploy.branch = "master" # default: gh-pages
  # deploy.user  = "tvaughan" # no default
  # deploy.port  = 5309 # ssh port, default: 22
  deploy.clean = true
end

compass_config do |config|
  # nested, expanded, compact, compressed
  config.output_style = :compressed
  config.sass_options = {:line_comments => false}
end

page "/feed.xml", :layout => false

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :css_compressor, ::YUI::CssCompressor.new

set :haml, { :attr_wrapper => "\"" }

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Create favicon/touch icon set from source/favicon_base.png
  activate :favicon_maker

  activate :directory_indexes

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end