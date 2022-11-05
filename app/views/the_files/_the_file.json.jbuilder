json.extract! the_file, :id, :file, :title, :text, :created_at, :updated_at
json.url the_file_url(the_file, format: :json)
json.file url_for(the_file.file)
