class AddTitreColunmToEvenements < ActiveRecord::Migration
  def self.up
    add_column :evenements, :titre, :string
  end

  def self.down
    remove_column :evenements, :titre
  end
end
