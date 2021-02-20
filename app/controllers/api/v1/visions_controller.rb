class Api::V1::VisionsController < ApplicationController
    before_action :set_vision, only: [:update]

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

    def update
        if @vision.update(vision_params)
            render json: @vision, status:accepted
        else
            render json: {errors: @vision.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy
        vision = Vision.find(params[:id])
        vision.delete
        render json: vision
    end

    private

    def set_vision
        @vision = Vision.find_by(params[:id])
    end

    def vision_params
        params.require(:vision).permit(:title, :description, :image_url, :theme_id)
    end
end
