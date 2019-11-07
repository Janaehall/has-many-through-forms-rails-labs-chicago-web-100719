class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :posts, through: :comments
end
