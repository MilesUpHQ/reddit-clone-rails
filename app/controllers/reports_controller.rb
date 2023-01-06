class ReportsController < ApplicationController
  def create
    report = Report.new (report_params)
    if report.save
      flash[:notice] = "Thanks for your report"
    else
      flash[:alert] = "Sorry something went wrong"
    end
    respond_to do |format|
      format.html {  redirect_to community_post_path(report.post.community_id, report.post) }
      format.js
    end
  end

  def report_params
    params.require(:report).permit(:post_id, :account_id, :report_category_id, :report_reason_id)
  end
end
