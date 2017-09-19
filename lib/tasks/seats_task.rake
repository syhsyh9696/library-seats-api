desc 'Display the first room in database'
task :display_first_room => :environment do
  puts first_room.name
end

desc 'Display the user token'
task :display_token, [:username, :password] do |t, params|
  puts token(params.username, params.password)
end

desc 'Get all tasks'
task :display_all_tasks => :environment do
  Task.all.each do |task|
    puts task
  end
end


# --- Method ---

def first_room
  Room.first
end

def token user, pwd
  page = Mechanize.new
  page.get "http://seat.ujn.edu.cn/rest/auth?username=#{user}&password=#{pwd}"
  JSON.parse(page.page.body)['data']['token']
end
