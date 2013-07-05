class Comment
  include Mongoid::Document
  self.mass_assignment_sanitizer = :strict
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  embedded_in :commentable, polymorphic: true

  field :text, type: String
  field :author, type: String # I decided to duplicate instead of referencing
  field :image_url, type: String # so that it would be only 1 Mongo call 
                                 # because it is all embeded in the 'commentable' model anyway
  
  field :creator_id, type: Moped::BSON::ObjectId
  validates_presence_of :creator_id

  def creator
    return User.find(self.creator_id)
  end

  def creator=(user)
    self.creator_id = user._id
  end

end
