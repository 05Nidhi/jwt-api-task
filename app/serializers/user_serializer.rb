class UserSerializer < ActiveModel::Serializer
  attributes :email,:created_at

  def created_at
    object.created_at.strftime("%d-%B-%Y %I:%M %p ")
  end
end
