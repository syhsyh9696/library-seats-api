class Task < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :seat, presence: true

  def token
    page = Mechanize.new
    page.get "http://seat.ujn.edu.cn/rest/auth?username=#{self.username}&password=#{self.password}"

    JSON.parse(page.page.body)['data']['token']
  end
end
