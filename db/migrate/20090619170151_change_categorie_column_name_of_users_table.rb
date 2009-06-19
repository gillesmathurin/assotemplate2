class ChangeCategorieColumnNameOfUsersTable < ActiveRecord::Migration
  def self.up
    rename_column :users, :categorie, :usertype
  end

  def self.down
    rename_column :users, :usertype, :categorie
  end
end
