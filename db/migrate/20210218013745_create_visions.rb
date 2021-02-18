class CreateVisions < ActiveRecord::Migration[6.0]
  def change
    create_table :visions do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
