class User
  include Mongoid::Document
  self.mass_assignment_sanitizer = :strict
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  has_many :projects
  embeds_many :comments, as: :commentable

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  field :username, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :description, type: String
  field :image_url, type: String

  index username: 1

  def default_image_url
    self.image_url.present? ? self.image_url.to_s : "http://i.imgur.com/koNQEql.jpg"
  end


  # TODO, create page_data method
  # views should have as little shit as possible
  # page_data function to give out hash
  # move it out in a presetner, they are models that provide a specific representation of other models
=begin
  @user.page_data %>
  render Page.for_user(@user)
  pages/_page
  users/_page
  Page.new(@user)

  Don't be afraid to have another object and hand it that User
=end
  # 
end
