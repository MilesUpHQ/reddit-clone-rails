# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

elow are the setups to run Ruby on Rails application on your system.

Make sure Ruby is installed on your system. Fire command prompt and run command:

ruby -v
Make sure Rails is installed

rails -v
If you see Ruby and Rails version then you are good to start, other wise Setup Ruby On Rails on Ubuntu

Once done, Now

Clone respected git repository

git clone https://github.com/martynbiz/human_services_finder.git
Install all dependencies

bundle install
Create db and migrate schema

rake db:create
rake db:migrate
Now run your application

rails s

p.s If you are not using RVM yet I would strongly recommend doing so!
@beerender

