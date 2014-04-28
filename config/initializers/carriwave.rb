CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIJCDQ6ISOR5EW3PA',                        # required
    :aws_secret_access_key  => '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',                        # required
  }

  config.fog_directory  = 'xinghu'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end