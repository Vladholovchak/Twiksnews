# frozen_string_literal: true

schedule_file = 'config/schedule.yml'

Sidekiq.configure_server do |config|
  config.redis = { url: 'REDIS_URL' }
  schedule_file = 'config/schedule.yml'
  if File.exist?(schedule_file) && Sidekiq.server?
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'REDIS_URL' }
end
