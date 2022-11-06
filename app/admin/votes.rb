ActiveAdmin.register Vote do
  permit_params :account_id, :post_id ,:upvote 
end
