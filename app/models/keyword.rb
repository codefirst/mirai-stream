class Keyword < ActiveRecord::Base
  belongs_to :user
  attr_accessible :keyword

  def self.get(id, user)
    Keyword.where(id: id, user_id: user).first
  end
end
