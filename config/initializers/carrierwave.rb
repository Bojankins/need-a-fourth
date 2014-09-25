CarrierWave.configure do |config|
  if Rails.env.production?
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'

    config.storage = :s3
    config.s3_access_key_id = 'AKIAJJNVNWCTBWMOVARA',
    config.s3_secret_access_key = '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',
    config.s3_bucket = 'kentucky89'
  else
    config.storage = :file
  end
end