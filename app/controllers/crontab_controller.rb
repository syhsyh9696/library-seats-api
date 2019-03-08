class CrontabController < ApplicationController
  def update_crontab_file
    CrontabFileUpdateJob.perform_later
    redirect_to :controller => 'tasks', :action => 'index'
  end
end
