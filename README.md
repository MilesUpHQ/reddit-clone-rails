<h2>Clone Repository</h2>
1. git clone https://github.com/mithun30052001/Discussion-Forum.git
<h2>Go to App Directory</h2>
<b>2. cd Discussion-forum-app</b>
<h2>Installing Dependencies</h2>
 
<b>3. bundle install<br>
4. yarn add bulma@5.0.0 <br>
5. yarn add jquery  <br>
6. yarn add @popperjs/core</b>

<h2> Drop the duplicate column discussion_id from votes </h2>

<h2>Migrate-Database</h2>

<b>rails db:{drop,migrate}</b>

<h2> Delete all the files related to actiontext and install actiontext <h2>
<b> rails actiontext :install </b>
 
 
<h2>Run Server</h2>
<b>rails s</b>
 
 <h2> Signup admin account and make the account as admin using rolify </h2>
 <h3> Type the following commands in command line </h3>
 <h4> rails c </h4>
 <h4> @user.add_role "admin"  </h4>
 <h4> @user.save </h4>
