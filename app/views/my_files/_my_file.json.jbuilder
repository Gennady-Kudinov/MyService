json.extract! my_file, :id, :name, :path, :created_at, :updated_at
json.url my_file_url(my_file, format: :json)
