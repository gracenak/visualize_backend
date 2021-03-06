class ThemeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :visions
end
