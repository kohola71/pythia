OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '165852203609311', '49ebd0951251555ad8df8697c4686fef'
end

