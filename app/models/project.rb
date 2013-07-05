class Project
  include Mongoid::Document
  self.mass_assignment_sanitizer = :strict
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  belongs_to :user
  embeds_many :comments, as: :commentable

  field :name, type: String
  field :description, type: String
  field :image_url, type: String

  def default_image_url
    self.image_url.present? ? self.image_url.to_s : "http://i.imgur.com/FQSStCN.png"
  end

end
