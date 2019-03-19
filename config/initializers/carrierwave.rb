CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAI6ZWZQ6L3T2QOWQQ',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'rails-audio-cdshop'
  config.cache_storage = :fog
end