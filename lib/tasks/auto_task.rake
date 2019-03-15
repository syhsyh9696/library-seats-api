require_relative 'task_lib'
include TaskLib

desc 'New auto send task [v1.1]'
task :auto_run_tasks => :environment do
  attempt_max = 200
  while attempt_max > 0 do
    break if server_on?
    attempt_max -= 1
  end

  store_log = -> (username, seat, data, start_time, end_time){
    Log.create(:username => username, :seat => seat, :data => data, :start_time => start_time, :end_time => end_time)
  }

  tuesday_flag = tuesday_tomorrow?

  Task.find_each do |task|
    user = Jovian.new(task.username, task.password)
    if tuesday_flag
      result = user.book(task.seat, task.start, 660, 1)
    else
      result = user.book(task.seat, task.start, task.end, 1)
    end
    store_log.call(task.username, task.seat, result, task.start, task.end)
    CheckinJob.set(wait_until: (Date.tomorrow + task.start.minutes)).perform_later(task.username, task.password)
  end
end