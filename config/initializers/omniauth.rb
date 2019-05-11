Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1285568398265659'], ENV['434e02d096414d87294812eab1bd9087']

end
