class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published

  has_many :comments
end
