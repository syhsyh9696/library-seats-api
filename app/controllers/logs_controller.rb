class LogsController < ApplicationController
  def index
    @logs = Log.order(id: :desc).page params[:page]
  end
end
