# Puma forks multiple OS processes within each dyno to allow a Rails app to support multiple concurrent requests. In Puma terminology these are referred to as worker processes (not to be confused with Heroku worker processes which run in their own dynos). Worker processes are isolated from one another at the OS level, therefore not needing to be thread safe.

workers Integer(ENV['WEB_CONCURRENCY'] || 2)

# Each worker process used consumes additional memory. This limits how many processes you can run in a single dyno. With a typical Rails memory footprint, you can expect to run 2-4 Puma worker processes on a 1x dyno. Your application may allow for more or less depending on your specific memory footprint. We recommend specifying this number in a config var to allow for faster application tuning. Monitor your application logs for R14 errors (memory quota exceeded) via one of our logging addons or heroku logs.

threads_count = Integer(ENV['MAX_THREADS'] || 5)

# Puma can serve each request in a thread from an internal thread pool. This allows Puma to provide additional concurrency for your web application. Loosely speaking, workers consume more RAM and threads consume more CPU, and both provide more concurrency.

threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end