module V1
  class Tags < Grape::API
    version 'v1'
    format :json

    resource :tags do
      # desc "Return list of tags"
      # get do
      #   Tag.all
      # end

      desc "Create a tag"
      post do
        begin
          Tag.create!({
            uid:          params[:uid],
            rid:          params[:rid],
            product_id:   params[:product_id],
            technology:   params[:technology],
            tag_type:     params[:tag_type],
            manufacturer: params[:manufacturer]
          })
        rescue ActiveModel::ForbiddenAttributesError, ActiveRecord::RecordInvalid => ex
          error!('validation failed', 422)
        end
      end

      route_param :uid do
        resource :product do
          get do
            tag = Tag.where(uid: params[:uid], rid: params[:rid]).first
            error!('fake tag', 200) unless tag
            tag.product
          end
        end
      end
    end
  end
end
