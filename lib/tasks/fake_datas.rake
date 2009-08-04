desc "Creation de données factices dans la base de données"
task :load_fakedatas => :environment do
  # Suppression des données de la base
  Association.delete_all
  Article.delete_all
  Evenement.delete_all
  Comment.delete_all
  Faq.delete_all
  # User.delete_all
  Gallery.delete_all
  
  # Creation de l'association
  @association = Association.create(:nom => "Agouti", :adresse => "rue Lethière", :email => Faker::Internet.email,
   :cp => Faker::Address.zip_code,
   :ville => Faker::Address.city, :tel => Faker::PhoneNumber.phone_number, :fax => Faker::PhoneNumber.phone_number,
   :about_us => Faker::Lorem.paragraph, :date_creation => "1980-05-24")
  
  # Creation des Users-Membres
  1.upto(4) do |x|
    User.create(:login => Faker::Internet.user_name, :email => Faker::Internet.email, :name => Faker::Name.name, :password => "secret#{x}", :profil => Faker::Lorem.paragraphs(3),
      :password_confirmation => "secret#{x}", :usertype => "2", :state => 'active')
  end
  User.create(:login => "beta", :email => Faker::Internet.email, :name => Faker::Name.name, :password => "betapass",
    :password_confirmation => "betapass", :usertype => "1", :state => 'active', :profil => Faker::Lorem.paragraphs(3))
  
  # Creation de 3 articles
  1.upto(3) do
    @user = User.find(:first, :offset => (User.count * rand).to_i)
    @article = Article.create(:titre => Faker::Lorem.sentence, :body => Faker::Lorem.paragraphs,
     :user_id => @user.id)
    @comment = Comment.create(:auteur => Faker::Lorem.name, :body => Faker::Lorem.paragraphs, :article_id => @article.id)
  end
  
  # Creation de 3 evenements
  1.upto(3) do |x|
    Evenement.create(:date => (Date.today + x), :h_debut => Time.now, :h_fin => (Time.now + 4), :lieu => Faker::Lorem.words,
     :description => Faker::Lorem.paragraphs, :titre => Faker::Lorem.words)
  end
  
  # Creation de 3 faqs
  1.upto(3) do
    Faq.create(:question => Faker::Lorem.sentence, :reponse => Faker::Lorem.paragraph, :association_id => @association.id)
  end
  
  # Creation de 3 galleries
  1.upto(3) do
    @user = User.find(:first, :offset => (User.count * rand).to_i)
    Gallery.create(:titre => Faker::Lorem.words, :description => Faker::Lorem.paragraphs, :user_id => @user.id)
  end
end