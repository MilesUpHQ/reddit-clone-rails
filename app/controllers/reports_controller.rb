class ReportsController < ApplicationController
  def create
    report_params = params.require(:report).permit(:post_id, :account_id, :report_category_id, :report_reason_id)
    report = Report.create!(report_params)
    flash[:notice] = "Post reported"
    respond_to do |format|
      format.html {  redirect_to community_post_path(report.post_id, report.post) }
      format.js
    end
  end
end