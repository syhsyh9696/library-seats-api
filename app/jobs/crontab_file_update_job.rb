class CrontabFileUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    system('cd #{Rails.root} && whenever --update-crontab')
  end
end
