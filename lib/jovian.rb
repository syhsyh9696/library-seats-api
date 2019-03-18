require 'httparty'
require 'json'

class Jovian
  include HTTParty

  # Constant definition
  BASE_URL = "http://seat.ujn.edu.cn".freeze

  attr_accessor :username, :password

  def initialize(username, password)
    @username = username.to_s
    @password = password.to_s
  end

  def token
    url_token = ->(username, password){ BASE_URL + "/rest/auth?username=#{username}&password=#{password}" }
    JSON.parse(HTTParty.get(url_token.call(@username, @password), format: :plain))['data']['token']
  end

  def request(method, url, token, params = nil)
    header = {
        'Host': 'seat.ujn.edu.cn:8443',
        "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8",
        'Connection': "keep-alive",
        "token": token,
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36",
        'Accept-Encoding': 'gzip',
        'X-Forwarded-For': '10.167.159.118'
    }
    result = HTTParty.send method.to_sym, url, { :headers => header, :body => params }
  end

  def user
    url_user = -> { BASE_URL + '/rest/v2/user' }
    JSON.parse(request('get', url_user.call, self.token).body)
  end

  def filter
    url_filter = -> { BASE_URL + "/rest/v2/free/filters" }
    JSON.parse(request(:get, url_filter.call, self.token).body)
  end

  def history(page = 1, count = 20)
    url_history = -> (page, count){ BASE_URL + "/rest/v2/history/#{page}/#{count}" }
    JSON.parse(request('get', url_history.call(page, count), self.token).body)
  end

  def reservations
    url_reservation = -> { BASE_URL + "/rest/v2/user/reservations" }
    JSON.parse(request('get', url_reservation.call, self.token).body)
  end

  def checkin
    url_checkin = -> { BASE_URL + '/rest/v2/checkIn'}
    JSON.parse(request(:get, url_checkin.call, self.token).body)
  end

  def cancel(reservation_id)
    url_cancel = -> (r_id){ BASE_URL + "/rest/v2/cancel/#{r_id}" }
    JSON.parse(request(:get, url_cancel.call(reservation_id), self.token).body)
  end

  def cancel_the_recent_one
    reservations = self.history(1,10000)['data']['reservations']
    return false if reservations.nil?
    valid_reservation = reservations.find {|e| e['stat'] == "RESERVE"}
    puts valid_reservation
    reservations_id = valid_reservation.size == 0 ? nil : valid_reservation['id']
    return false if reservations_id.nil?
    self.cancel(reservations_id)
    return true
  end

  def cancel_all
    id = -> (hash_element){ hash_element['id'] }
    iter = -> (resv){ self.cancel(resv) unless resv.nil? }
    self.reservations['data'].collect(&id).each(&iter)
  end

  def book(seat_id, start_time, end_time, date_symbol)
    url_book = -> { BASE_URL +  "/rest/v2/freeBook" }
    date_symbol = date_symbol.to_i
    params = {
        'startTime' => start_time.to_s,
        'endTime' => end_time.to_s,
        'seat' => seat_id,
        'date' => (Time.new + (86400 * date_symbol)).strftime("%Y-%m-%d")
    }
    JSON.parse(request(:post, url_book.call, self.token, params).body)
  end

end