class Log < ApplicationRecord
  def status
    return eval(self.data)['status']
  end
end
