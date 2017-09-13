module API
  class Library < Grape::API
    version 'v1', using: :path # Define API::Version
    format :json # Define return format

    helpers do
      def user_history(username, password)
        username = username.to_s; password = password.to_s; temp = {}
        page = Mechanize.new
        page.get "http://seat.ujn.edu.cn/rest/auth?username=#{username}&password=#{password}"

        data = JSON.parse(page.page.body)
        status = data['status']
        return { 'status': 'fail', 'data': nil } if status == 'fail'

        token = data['data']['token']
        page.get "http://seat.ujn.edu.cn/rest/v2/history/1/20?token=#{token}"
        data = JSON.parse(page.page.body)

        temp['status'] = data['status']; temp['data'] = data['data']['reservations']
        temp
      end

    end

    namespace :library do
      get '/history/:number' do
        user_history(params[:number], params[:number])
      end

    end
  end
end
