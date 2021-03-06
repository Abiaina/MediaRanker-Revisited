class User < ApplicationRecord
  has_many :votes
  has_many :ranked_works, through: :votes, source: :work

  validates :username, uniqueness: true, presence: true

  validates :uid, uniqueness: true, presence: true


  def self.build_from_github (auth_hash)
    user = User.new
    user.username = auth_hash["info"]["nickname"]
    user.email = auth_hash["info"]["email"]
    user.uid = auth_hash["uid"]
    user.provider = "github"
    user.save
    return user
  end
end
