class Comment < ActiveRecord::Base
  before_create :set_date

  belongs_to :entry

  def set_date
    self.post_date = Time.now
  end
end
