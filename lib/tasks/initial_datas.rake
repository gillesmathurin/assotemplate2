desc "creation de l'association et de ressources associées"
task :make_asso => :environment do
  Association.delete_all
  User.delete_all
  
  Association.create(:nom => "Agouti", :adresse => "rue Lethière")
  # creation d'un membre
  User.create(:login => "aaron", :email => "gillesmath@me.com", :name => "aaron buster", :password => "secret",
    :password_confirmation => "secret", :usertype => "2", :state => 'active')
  # creation d'un administrateur
  User.create(:login => "quentin", :email => "gillesmath@mac.com", :name => "quentin buster", :password => "administrateur",
    :password_confirmation => "administrateur", :usertype => "2", :state => 'active')
end