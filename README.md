# Reddit Clone Rails
![Reddit](https://play-lh.googleusercontent.com/MDRjKWEIHO9cGiWt-tlvOGpAP3x14_89jwAT-nQTS6Fra-gxfakizwJ3NHBTClNGYK4)
<br />
<h1> Welcome to Reddit Clone App using Rails </h1>

## _Requirments_
```
* Github
* Ruby 3.0.4
* Rails 6.1.7
* node 12.13.0
* npm 8.19.2
* yarn 1.22.19
```

## _Installation_
1. Checkout to your Repository(Directory)
```
  $ git clone "www.github.com/iMagesh/reddit-clone.git"
```
2. Go to the Directory in Terminal
```
  $ cd reddit_clone
```
3. Install the Pre requisite
  - Install all the Gem given in Gem.rb file
  - Install Bootstrap and other js libraries as node modules using npm
```
  $ bundle install  # install dependent gems
  $ npm install     # install dependenties
  $ yarn install    # for generating dependent manifest.js
```
4. Create and Setup Database
```
  $ rails db:create
  $ rails db:migrate
```
5. Add .env file at root directory path
```
  https://github.com/MilesUpHQ/reddit-clone-rails/blob/master/.env.sample
```
### Note : To make you authorized SMTP connection account contact
### [Tushar R](https://github.com/tusharravindran)
### [Vasanthakumar A](https://github.com/vasanthakumar-a)
6. Seed Accounts, Communities and Posts
```
  $ rails db:seed
```
7. Start the Rails Server
```
  $ rails server
```
And now you can vist the site with the URL http://localhost:3000
