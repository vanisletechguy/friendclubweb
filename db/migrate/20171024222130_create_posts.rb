class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.float :longitude
      t.float :latitude
      t.string :image

      t.timestamps
    end
  end
end
