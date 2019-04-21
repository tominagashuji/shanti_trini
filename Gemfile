source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

#core
gem 'rails', '~> 5.1.5'

#middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'

#Virw,front
gem 'coffee-rails', '~> 4.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"

#画像アップロード
gem 'carrierwave'
gem 'mini_magick'

#メール
gem 'bcrypt', '3.1.11'

#デバッグ
gem 'pry-rails'

#seedデータ作成
gem 'faker'

#アプリ
gem 'ransack'
gem 'kaminari'

#other
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#デバッグ
gem 'pry-rails'
gem 'better_errors'
gem 'binding_of_caller'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'

end
