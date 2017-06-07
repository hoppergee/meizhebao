class Post < ApplicationRecord
   validates_presence_of :content
   belongs_to :user

   has_many :scores, :class_name => "PostScore"
   def find_score(user)
      user && self.scores.where( :user_id => user.id ).first
   end
   def average_score
      self.scores.average(:score)
   end

  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user

  def find_like(user)
    self.likes.where( :user_id => user.id ).first
  end

end
