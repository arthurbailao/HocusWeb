class API < Grape::API
  helpers do
    def logger
      API.logger
    end
  end
  
  prefix 'api'
  mount V1::Root
  # mount API::V2::Root (next version)
end