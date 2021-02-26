class Api::V1::VisionsController < ApplicationController

    def index
        visions = Vision.all.order_by_created_at
        render json: VisionSerializer.new(visions)
    end

    def create
        vision = Vision.new(vision_params)
        if vision.save
            render json: VisionSerializer.new(vision), status: :accepted
        end
    end

    def destroy
        vision = Vision.find(params[:id])
        vision.delete
        render json: vision
    end

    private

    def vision_params
        params.require(:vision).permit(:title, :description, :image_url, :theme_id)
    end
end