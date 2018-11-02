class Log < ApplicationRecord
  def status
    return JSON.parse(self.data)['status']
  end
end
