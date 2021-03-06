class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   # Virtual attribute for authenticating by either username or email
   # This is in addition to a real persisted field like 'username'
   attr_accessor :login

   def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

  validates :username, :presence => true,
  :uniqueness => {
    :case_sensitive => false
  } # etc.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # everything above is for Devise authentication/authorization
  
  # relationship with Account
  has_one :account

  after_create :register_account

  def register_account
    user = User.last
    account = Account.create!(user_id: user.id)
  end

end
