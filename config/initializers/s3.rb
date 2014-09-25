CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAI2ANTURSR7DGAZOA',
      :aws_secret_access_key  => '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'
      # :region                 => ENV['S3_REGION'] # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = 'kentucky89'
end