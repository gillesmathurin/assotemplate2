class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :titre
      t.integer :user_id
      t.text :body
      t.string :photo_file_name
      t.integer :photo_file_size
      t.string :photo_content_type
      t.datetime :photo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
