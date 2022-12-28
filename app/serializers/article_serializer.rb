class ArticleSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id ,:email

  attributes :created_time do |obj|
    obj.created_at.strftime("%d-%B-%Y %I:%M %p")
  end
end
