class Entry < ActiveRecord::Base
  before_create :set_date_and_user

  belongs_to :user
  has_many :comments

  def set_date_and_user
    self.post_date = Time.now
  end
end
