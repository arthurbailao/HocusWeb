module V1
  class Root < Grape::API
    error_formatter :json, ErrorFormatter

    if Rails.env == 'production'
      rescue_from :all do |ex|
        error_response({message: "bad request"})
      end
    end
    mount V1::Tags
  end
end
