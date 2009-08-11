class CreateActivites < ActiveRecord::Migration
  def self.up
    create_table :activites do |t|
      t.string :nom
      t.text :description
      t.string :tarif
      t.string :public_recu
      t.string :lieu
      t.string :horaire

      t.timestamps
    end
  end

  def self.down
    drop_table :activites
  end
end
