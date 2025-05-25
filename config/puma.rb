# config/puma.rb

threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
threads threads_count, threads_count
workers ENV.fetch("WEB_CONCURRENCY", 2)

app_dir = File.expand_path("../..", __FILE__)

if ENV["RAILS_ENV"] == "production"
  bind "unix://#{app_dir}/tmp/sockets/puma.sock"
  pidfile "#{app_dir}/tmp/pids/puma.pid"
  stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true
else
  port ENV.fetch("PORT", 3000)
end

environment ENV.fetch("RAILS_ENV", "development")

plugin :tmp_restart
