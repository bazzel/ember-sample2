class Post < ActiveRecord::Base
  attr_accessible :body, :published, :title

  has_many :comments
end
