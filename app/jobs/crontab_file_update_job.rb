require 'open3'

class CrontabFileUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    out, err, status = Open3.capture3('cd #{Rails.root} && whenever --update-crontab')
  end
end
