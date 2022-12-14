class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick


  # По умолчанию CarrierWave дважды копирует загруженный файл, 
  # сначала копируя файл в кеш, а затем копируя файл в хранилище. 
  # Для больших файлов это может занять слишком много времени.
  # Вы можете изменить это поведение, переопределив один или 
  # оба метода move_to_cache и move_to_store:
  def move_to_store
    true
  end

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    #"D://BAZA/Image/#{model.id}"
  end

  # Метод изменения адреса расположения прикрепленных картинок к ордеру
  # def cache_dir
  #   "BAZA/Image/#{model.id}"
  # end

  # Защита, белый список расширений доступных для загрузки
  def extension_whitelist
    %w(jpg jpeg gif png zip bin hex)
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_allowlist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
