ActiveAdmin.register Comment , :as => "PostComment" do
  permit_params :message, :post_id
end
