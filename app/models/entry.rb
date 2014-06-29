class Entry < ActiveRecord::Base
  before_create :set_date

  belongs_to :user
  has_many :comments

  def set_date
    self.post_date = Time.now
  end
end
