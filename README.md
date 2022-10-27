<h2>1.Clone Repository</h2>
 git clone https://github.com/mithun30052001/Discussion-Forum.git
<h2>2.Go to App Directory</h2>
<b> cd Discussion-forum-app</b>
<h2>3.Installing Dependencies</h2>
 
<b>bundle install<br>
yarn add bulma@5.0.0 <br>
yarn add jquery 
sudo apt-get install libmagickwand-dev
sudo apt-get install imagemagick --fix-missing</b>

<h2>4. Migrate-Database</h2>

<b>rails db:{drop,migrate}</b>

<h2>5.Delete all the files related to actiontext and install actiontext </h2>
<b>rails action_text:install </b>
<h2>6.Add the cotents given in application.js file </h2>
 <b>import "trix"<br>
import "@rails/actiontext"</b>
 
 
<h2>7. Run Server</h2>
<b>rails s</b>
 
 <h2>8. Signup admin account and make the account as admin using rolify </h2>
 <h3> Open rails console and make the account as admin account </h3>
 <b> rails c <br>
  User.connection <br>
  @user=User.find(id) <br>
  @user.add_role "admin" <br>
  @user.save </b>
