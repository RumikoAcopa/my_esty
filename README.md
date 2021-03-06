# My Esty
Welcome to My Esty! My Esty allows you to create a 
personalized/customized skin care 
regiment on the go.  


## Installation 
Read all the way through before starting Installation:
- download or clone the repository
- ```cd``` into the recipe_box directory
- run ```bundle install``` in your console
- create a file in the root directory called ```.env```
- inside ```.env```, enter ```SESSION_SECRET=```
- in your terminal, run ```generate_secret```
- copy and paste the output into your ```.env``` file directly after ```SESSION_SECRET=```
- create a file in the root directory called ```.gitignore```
- inside ```.gitignore```, enter ```.env```. This will make sure your ```.env``` file is not tracked in git
- run ```rake db:migrate```
- run ```shotgun``` 
- open up your web browser and enter the local url provided by the shotgun server

Make sure your Gemfile includes these:
source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3', '~> 1.3.6'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'sinatra-flash'

group :development, :test do
gem 'dotenv'
gem 'session_secret_generator'
end

group :test do
gem 'rspec'
gem 'capybara'
gem 'rack-test'
gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end


## Usage

To use My Esty. Go to the Home Page and create an account with an Email and Password. 
Once logged in there a brief overview of how My Esty works.  
Simpy "Choose My Product" at the top left of the page to get started personalizing your 
Skin Care Package!
-Personalize with a Package Name 
-Select Products that fit your skin type. (If you don't know your skin type there is a little
    reference guide at the home page.  Click "My Esty" to go back or simply press "back".)
-Once your package is submitted then you are directed to a page where your package(s) will be listed.
-Click on your package to see a detailed list of your products. 
-You may edit your products or delete the package entirely.
-Congratulations! You're now on the way to Healthier, Brighter, & More Youthful looking skin!

#YourCodingEsty

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
