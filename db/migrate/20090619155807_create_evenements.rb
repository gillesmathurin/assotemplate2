class CreateEvenements < ActiveRecord::Migration
  def self.up
    create_table :evenements do |t|
      t.date :date
      t.time :h_debut
      t.time :h_fin
      t.string :lieu
      t.text :description
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :evenements
  end
end
