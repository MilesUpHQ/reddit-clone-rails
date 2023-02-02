# Reddit Clone Rails
<img src="https://play-lh.googleusercontent.com/MDRjKWEIHO9cGiWt-tlvOGpAP3x14_89jwAT-nQTS6Fra-gxfakizwJ3NHBTClNGYK4" />
<img src="https://user-images.githubusercontent.com/81355826/216020542-4d71007d-a23c-45e2-99b4-41e49ca8b953.png" width="330" height="100" />

<br />
<h1> Welcome to Reddit Clone App using Rails API </h1>

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
  $ git clone https://github.com/MilesUpHQ/reddit-clone-api.git
```
2. Go to the Directory in Terminal
```
  $ cd reddit_clone
```
3. Install the Pre requisite
  - Install all the Gem given in Gem.rb file
```
  $ bundle install  # install dependent gems
```
4. Setup Sqlite3 Database
```
  It is default in rails so no installation needed
  
`````

5. Create and Migrate Database
```
  $ rails db:create
  $ rails db:migrate
```

6. Seed Accounts
```
  $ rails db:seed
```
7. Start the Rails Server
```
  $ rails server
```
And now the api is running in URL http://localhost:3000

Now start React App (Frontend) - https://github.com/MilesUpHQ/reddit-clone-react.git
