class VisionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :image_url, :theme_id, :theme
end
