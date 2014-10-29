class SignIn < ActiveRecord::Base
  validates :user, :session_token, presence: true
  validates :session_token, uniqueness: true

  belongs_to :user, inverse_of: :sign_ins

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end

  def ==(other)
    other.is_a?(SignIn) && self.session_token == other.session_token
  end

  private

  def generate_unique_session_token
    loop do
      token = SecureRandom.base64(16);
      return token unless SignIn.exists?(session_token: token)
    end
  end


end
