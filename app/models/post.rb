class Post < ActiveRecord::Base
  attr_accessible :body, :published, :title

  has_many :comments, :dependent => :destroy
  has_many :trackbacks, :dependent => :destroy
end
