class Log < ApplicationRecord
  paginates_per 10

  def status
    return eval(self.data)['status']
  end
end
