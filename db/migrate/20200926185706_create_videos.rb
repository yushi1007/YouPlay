class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :video_id
      t.string :title
      t.string :thumbnail_url
      t.string :category
      
      t.timestamps
    end
  end
end
