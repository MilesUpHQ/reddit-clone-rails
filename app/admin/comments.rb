ActiveAdmin.register Comment , :as => "PostComment" do
  permit_params :message, :post_id, :account_id
end