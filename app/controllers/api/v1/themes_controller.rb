class Api::V1::ThemesController < ApplicationController
    def index
        themes = Theme.all
        render json: ThemeSerializer.new(themes)
    end
end
