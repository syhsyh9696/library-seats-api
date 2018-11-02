class LogsController < ApplicationController
  def index
    @logs = Log.take(50)
  end
end
