class Comment < ActiveRecord::Base
  before_create :set_date

  belongs_to :entry

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }
  validates :description, presence: true, length: { minimum: 1, maximum: 1024 }

  def set_date
    self.post_date = Time.now
  end
end
