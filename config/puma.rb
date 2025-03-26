threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 3000)}"

plugin :tmp_restart
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

plugin :tailwindcss if ENV.fetch("RAILS_ENV", "development") == "development"
