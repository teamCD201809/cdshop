CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: #'ここにアクセスキー',
    aws_secret_access_key: #'ここにプライベートキー',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'rails-cdshop-audio'
  config.cache_storage = :fog
end