module API
  class Library < Grape::API
    version 'v1', using: :path # Define API::Version
    format :json # Define return format

    helpers do
      def user_token(username, password)
        page = Mechanize.new
        page.get "http://seat.ujn.edu.cn/rest/auth?username=#{username}&password=#{password}"

        data = JSON.parse(page.page.body)
      end

      def user_history(username, password)
        username = username.to_s; password = password.to_s; temp = {}
        data = user_token(username, password)

        status = data['status']
        return { 'status': 'fail', 'data': nil } if status == 'fail'

        page = Mechanize.new
        token = data['data']['token']
        page.get "http://seat.ujn.edu.cn/rest/v2/history/1/20?token=#{token}"
        data = JSON.parse(page.page.body)

        temp['status'] = data['status']; temp['data'] = data['data']['reservations']
        temp
      end

      def user_checkin(username, password)
        data = user_token(username, password)
        status = data['status']
        return { 'status': 'fail', 'data': nil } if status == 'fail'

        page = Mechanize.new
        token = data['data']['token']
        page.get("http://seat.ujn.edu.cn/rest/v2/checkIn?token=#{token}").body
      end

      def remain_seats_count
        data = user_token('220130121003', '220130121003')
        status = data['status']
        return { 'status': 'fail', 'data': nil } if status == 'fail'

        page = Mechanize.new; result = []
        token = data['data']['token']; data = []
        '1'.upto('2').each do |n|
          page.get "http://seat.ujn.edu.cn/rest/v2/room/stats2/#{n}?token=#{token}"
          data = data + JSON.parse(page.page.body)['data']
        end

        data.each do |item|
          temp = {}
          temp['room_id'] = item['roomId']
          temp['room'] = item['room']
          temp['free'] = item['free']
          result << temp
        end

        result
      end

      def fav_seat(username, password)
        page = Mechanize.new; result = []
        page.get "http://seat.ujn.edu.cn/"
        page.get "http://seat.ujn.edu.cn/rest/auth?username=#{username}&password=#{password}"
        page.get "http://seat.ujn.edu.cn/freeBook/fav"

        doc = Nokogiri::HTML(page.page.body)
        doc.search("//div[@id='favSeatList']/div/ul/li/dl/dd").each do |item|
          result << { :seat => item.text }
        end

        result
      end

      def available_token

      end
    end

    namespace :library do
      get '/history/:number' do
        user_history(params[:number], params[:number])
      end

      get '/rooms' do
        { :rooms => Room.all }
      end

      get '/checkin/:number' do
        user_checkin(params[:number], params[:number])
      end

      get '/checkin/:number/:password' do
        user_checkin(params[:number], params[:password])
      end

      get '/remain' do
        remain_seats_count
      end

      get '/fav/:number' do
        fav_seat(params[:number], params[:number])
      end

      get '/fav/:number/:password' do
        fav_seat(params[:number], params[:password])
      end


    end
  end
end
