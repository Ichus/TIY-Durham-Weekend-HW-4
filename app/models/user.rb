class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  has_many :entries

  validates :password, presence: true, :length => { minimum: 6, maximum: 20 },
                       confirmation: true
  validates :username, presence: true, :uniqueness => true

  def self.authenticate(username, password)
    user = find_by username: username
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
