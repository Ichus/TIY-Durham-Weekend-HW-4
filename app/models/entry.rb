class Entry < ActiveRecord::Base
  before_create :set_date

  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  validates :description, presence: true, length: { minimum: 1 }
  #validate :title_unique

  def set_date
    self.post_date = Time.now
  end

  # Add authentication
  # def title_unique
  #   Entry.where(user_id: current_user.id).pluck(:title).each do |entry_title|
  #     if title == entry_title
  #       errors.add(:title, "Title used previously. Choose another Title")
  #     end
  #   end
  # end
end
