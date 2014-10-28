class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token

  validates :name, :session_token, presence: true
  validates :name, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}
  validates :password_token, presence: { message: "Password can't be blank"}




  #perfect pig

  def self.find_by_credentials(name, password)
    user = User.find_by_name(name);
    user && user.is_password?(password) ? user : nil
  end


  def password=(password)
    @passowrd = password
    self.password_token = BCrypt::Password.create(password);
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_token).is_password?(password);
  end

  def generate_session_token
    SecureRandom.base64(16);
  end

  def reset_session_token
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

end
