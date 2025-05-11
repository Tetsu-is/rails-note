namespace :dev do
  desc "Start Rails server with development settings"
  task :server do
    system "bin/rails server -b 0.0.0.0"
  end

  desc "Format Ruby files"
  task :format do
    system "bundle exec rubocop -A"
  end

  desc "Lint Ruby files"
  task :lint do
    puts "Running RuboCop..."
    system "bundle exec rubocop"
    puts '\nRunning Brakeman...'
    system "bundle exec brakeman"
  end

  desc "Run all formatters and linters"
  task lint_all: [ :format, :lint ]

  desc "Run database migrations"
  task :migrate do
    puts "Running pending migrations..."
    system "bin/rails db:migrate"
    puts '\nUpdating test database...'
    system "bin/rails db:test:prepare"
  end
end
