module Api
  class Library < Grape::API
    version 'v1', using: :param # Define API::Version and using params
    format :json

    helpers do
      def current_user(username, password)
        page = Mechanize.new
        page.get ""
      end



    end
  end

end
