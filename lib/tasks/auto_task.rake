require_relative 'task_lib'
include TaskLib

desc 'New auto send task [v1.1]'
task :auto_run_tasks => :environment do
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
    if result['status'] == 'success'
      CheckinJob.set(wait_until: (Date.tomorrow + task.start.to_i.minutes)).perform_later(task.username, task.password)
    end
  end
end

task :auto_run_tasks_delay => :environment do
  sleep(65)

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

    if result['status'] == 'success'
      CheckinJob.set(wait_until: (Date.tomorrow.to_time + task.start.to_i.minutes)).perform_later(task.username, task.password)
    end
  end
end

