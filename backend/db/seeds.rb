# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'

DEFAULT_ADMIN_USERNAME = "admin"
DEFAULT_ADMIN_EMAIL = "admin@devel.com"
DEFAULT_PASSWORD = "5ecReT!"

def seedCountries()
    Country.delete_all
    file = File.read('./templates/json/countries.json')
    data_hash = JSON.parse(file)
    countries = data_hash["ref_country_codes"]
    countries.each do |key, value|
        country = Country.new(
            :code  => key["alpha2"],
            :name => key["country"],
        )
        country.save!
    end
end

def seedContents()
    Content.delete_all
    file = File.read('./templates/json/contents.json')
    data_hash = JSON.parse(file)
    contents = data_hash["RECORDS"]
    contents.each do |key, value|
        content = Content.new(
            :key_name  => key["key_name"],
            :key_value => key["key_value"],
        )
        content.save!
    end
end


def seedContact()
    Contact.delete_all
    for i in 1..100 do
        contact = Contact.new(
            :name  => Faker::Name.unique.name,
            :email => Faker::Internet.safe_email,
            :phone => Faker::PhoneNumber.phone_number,
            :website  => Faker::Internet.url,
            :address =>  Faker::Address.street_address
        )
        contact.save!
    end
end


def seedUser()
    User.delete_all
    for i in 1..100 do
        country = Country.order("RAND()").limit(1).first()
        username = i === 1 ? DEFAULT_ADMIN_USERNAME : Faker::Internet.username
        email = i === 1 ? DEFAULT_ADMIN_EMAIL : Faker::Internet.safe_email

        findUserName  = User.find_by_username(username)
        findUserEmail = User.find_by_email(email)

        if(!findUserName || !findUserEmail)

            user = User.new(
                :country => country,
                :username => username,
                :email => email,
                :phone => Faker::PhoneNumber.phone_number,
                :address1 => Faker::Address.street_address,
                :address2 => Faker::Address.street_address,
                :zip_code => Faker::Address.zip_code,
                :city => Faker::Address.city,
                :password=> DEFAULT_PASSWORD,
                :is_admin => i === 1,
                :status=> true
            )
            user.save!

        end

    end
end

def seedAbout()
    About.delete_all
    file = File.read('./templates/json/abouts.json')
    data_hash = JSON.parse(file)
    abouts = data_hash["RECORDS"]
    abouts.each do |key, value|
        about = About.new(
            :title  => key["title"],
            :description => key["description"],
            :is_published => key["is_published"],
        )
        about.save!
    end
end

def seedCategoryArticle()
    CategoryArticle.delete_all
    file = File.read('./templates/json/category_articles.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        model = CategoryArticle.new(
            :name  => key["name"],
            :description => key["description"]
        )
        model.save!
    end
end

def seedCategoryProduct()
    CategoryProduct.delete_all
    file = File.read('./templates/json/category_products.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        model = CategoryProduct.new(
            :name  => key["name"],
            :description => key["description"]
        )
        model.save!
    end
end

def seedCategoryProject()
    CategoryProject.delete_all
    file = File.read('./templates/json/category_projects.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        model = CategoryProject.new(
            :name  => key["name"],
            :description => key["description"]
        )
        model.save!
    end
end

def seedCategoryFaq()
    CategoryFaq.delete_all
    file = File.read('./templates/json/category_faqs.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        model = CategoryFaq.new(
            :name  => key["name"],
            :description => key["description"]
        )
        model.save!
    end
end

def seedFeature()
    Feature.delete_all
    file = File.read('./templates/json/features.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        model = Feature.new(
            :icon  => key["icon"],
            :title => key["title"],
            :description => key["description"],
            :is_published => key["is_published"]
        )
        model.save!
    end
end

def seedTeam()
    Team.delete_all
    file = File.read('./templates/json/teams.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        model = Team.new(
            :name  => key["name"],
            :position => key["position"],
            :description => key["description"],
            :is_published => key["is_published"]
        )
        model.save!
    end
end

def seedFaq()
    Faq.delete_all
    file = File.read('./templates/json/faqs.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        category = CategoryFaq.order("RAND()").limit(1).first()
        model = Faq.new(
            :category  => category,
            :question => key["question"],
            :answer => key["answer"],
            :sort => key["sort"],
            :is_published => key["is_published"]
        )
        model.save!
    end
end

def seedProduct()
    Product.delete_all
    file = File.read('./templates/json/products.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        category = CategoryProduct.order("RAND()").limit(1).first()
        model = Product.new(
            :category  => category,
            :name => key["name"],
            :price => key["price"],
            :description => key["description"],
            :is_published => key["is_published"]
        )
        model.save!
    end
end

def seedProject()
    Project.delete_all
    file = File.read('./templates/json/projects.json')
    data_hash = JSON.parse(file)
    models = data_hash["RECORDS"]
    models.each do |key, value|
        category = CategoryProject.order("RAND()").limit(1).first()
        model = Project.new(
            :category  => category,
            :name => key["name"],
            :description => key["description"],
            :is_published => key["is_published"]
        )
        model.save!
    end
end

def seedNotification()
    Notification.delete_all
    for i in 1..100 do
        user = User.order("RAND()").limit(1).first()
        notifcation = Notification.new(
            :user  => user,
            :subject => Faker::Lorem.sentence,
            :sort_content => Faker::Lorem.paragraph(sentence_count: 1, supplemental: true),
            :full_content  => Faker::Lorem.paragraph(sentence_count: 10, supplemental: true),
        )
        notifcation.save!
    end
end

def seedArticle()
    Article.delete_all
    user = User.find_by(is_admin: 1)
    if(user)
        for i in 1..100 do
            title = Faker::Lorem.sentence
            categories = CategoryArticle.order("RAND()").limit(1)
            article = Article.new(
                :user  => user,
                :slug => title.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-'),
                :title => title,
                :content  => Faker::Lorem.paragraph(sentence_count: 20, supplemental: true),
                :is_published  => 1,
            )
            article.categories = categories
            article.save!
        end
    end
end

print "Begin instalation, please wait...\n"
# Run all 
seedCountries()
seedContents()
seedContact()
seedUser()
seedAbout()
seedCategoryArticle()
seedCategoryProduct()
seedCategoryProject()
seedCategoryFaq()
seedFeature()
seedTeam()
seedFaq()
seedProduct()
seedProject()
seedNotification()
seedArticle()
# End Seeding

print "-----------------------------------------\n"
print "Admin Username : "+DEFAULT_ADMIN_USERNAME+" \n"
print "Admin Email : "+DEFAULT_ADMIN_EMAIL+" \n"
print "Admin Password : 5ecReT!\n"
print "-----------------------------------------\n"
print "Instalaation has been finished :)\n"