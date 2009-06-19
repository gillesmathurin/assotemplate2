class CreateAssociations < ActiveRecord::Migration
  def self.up
    create_table :associations do |t|
      t.string :nom
      t.string :adresse
      t.string :cp
      t.string :ville
      t.string :tel
      t.string :fax
      t.string :email
      t.text :about_us
      t.date :date_creation
      t.string :banniere_file_name
      t.integer :banniere_file_size
      t.string :banniere_content_type
      t.datetime :banniere_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :associations
  end
end
