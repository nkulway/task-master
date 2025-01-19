# spec/swagger_helper.rb

RSpec.configure do |config|
  config.openapi_root = File.expand_path('../swagger', __dir__)

  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Tasks API',
        version: 'v1',
        description: 'API documentation for the Tasks app',
        contact: {
          name: 'API Team',
          email: 'api@example.com'
        }
      },
      paths: {},
      servers: [
        { url: 'http://localhost:3000' } # Update this URL as needed
      ]
    }
  }

  # Specify the format of the output Swagger file
  config.openapi_format = :yaml
end
