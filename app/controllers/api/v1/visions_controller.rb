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

    def destroy
        vision = Vision.find_by(params[:id])
        vision.delete
        render json: vision
    end

    private

    def vision_params
        params.require(:vision).permit(:title, :description, :image_url, :theme_id)
    end
end
