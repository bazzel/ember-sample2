class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published
end
