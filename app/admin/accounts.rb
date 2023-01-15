ActiveAdmin.register Account do
  permit_params :username, :first_name, :last_name, :email, :karma
end
