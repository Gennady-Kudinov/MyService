json.extract! comment, :id, :image, :author, :body, :articles_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
json.image url_for(comment.image)
