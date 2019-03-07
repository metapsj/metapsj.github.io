# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# time zone
Time.zone = "US/Pacific"

# asset paths
set :css_dir, "styles"
set :js_dir, "javascripts"
set :images_dir, "images"

# markdown
set :markdown_engine, :kramdown

# code highlighting
activate :syntax, line_numbers: true

# blog
activate :blog do |blog|
  blog.name = "blog"

  # This will add a prefix to all links, template references and source paths
  blog.prefix = "posts"
  # blog.permalink = "{year}/{month}/{day}/{title}.html"

  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "article"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"

  blog.default_extension = ".md.erb"
  blog.new_article_template = File.expand_path('../source/article-template.yaml', __FILE__)
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.custom_collections = {
    category: {
      link: '/categories/{category}.html',
      template: '/category.html'
    }
  }

  # enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

# autoprefixer
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# pretty urls
activate :directory_indexes

# livereload
configure :development do
	activate :livereload
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# per-page layout changes
# with alternative layout
# page '/path/to/file.html', layout: 'other_layout'
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/feed.xml", layout: false

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# build
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
activate :minify_html

configure :build do
	ignore '/admin/*'
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
	# activate :relative_assets
end

# deploy
activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = 'master'
  deploy.build_before = true
end

