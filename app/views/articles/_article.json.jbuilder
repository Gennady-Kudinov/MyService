json.extract! article, :id, :image, :name, :title, :text, :created_at, :updated_at
json.url article_url(article, format: :json)
json.image url_for(article.image)
