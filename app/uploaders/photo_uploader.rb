class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    '/images/'
  end

  def cache_dir
    '/tmp/'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  version :standard do
    resize_to_fill 400, 300
  end

  version :thumb do
    resize_to_fill 100, 100
  end
end
