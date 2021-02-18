class Api::V1::VisionsController < ApplicationController
    def index
        visions = Vision.all
        render json: VisionSerializer.new(visions)
    end

    def create
        vision = Vision.new(vision_params)
        if vision.save
            render json: VisionSerializer.new(vision), status: :accepted
        else
            render json: {errors: vision.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def vision_params
        params.require(:vision).permit(:title, :description, :image_url, :user_id)
    end
end
