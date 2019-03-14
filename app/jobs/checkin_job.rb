class CheckinJob < ApplicationJob
  queue_as :default

  def perform(username, password)
    user = Jovian.new(username, password)
    user.checkin
  end
end
