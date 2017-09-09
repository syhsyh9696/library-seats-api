module Api
  class Test < Grape::API
    version 'v1', using: :param # Define API::Version
    format :json # Define return format

    get :ping do
      { data: "pong" }
    end
  end

end
