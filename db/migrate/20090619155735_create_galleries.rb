class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :user_id
      t.string :titre
      t.text :description
      t.string :photo1_file_name
      t.string :photo1_file_content_type
      t.integer :photo1_file_size
      t.datetime :photo1_updated_at
      t.string :photo2_file_name
      t.string :photo2_content_type
      t.integer :photo2_file_size
      t.datetime :photo2_updated_at
      t.string :photo3_file_name
      t.string :photo3_content_type
      t.integer :photo3_file_size
      t.datetime :photo3_updated_at
      t.string :photo4_file_name
      t.string :photo4_content_type
      t.integer :photo4_file_size
      t.datetime :photo4_updated_at
      t.string :photo5_file_name
      t.string :photo5_content_type
      t.integer :photo5_file_size
      t.datetime :photo5_updated_at
      t.string :photo6_file_name
      t.string :photo6_content_type
      t.integer :photo6_file_size
      t.datetime :photo6_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
