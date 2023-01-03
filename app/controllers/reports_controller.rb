class ReportsController < ApplicationController
  def create
    report = Report.new (report_params)
    if report.save 
      flash[:notice] = "Thanks for your report. Your reporting helps make Reddit a better, safer, and more welcoming place for everyone; and it means a lot to us."
    else
      flash[:alert] = "Sorry something went wrong and this post was not reported. Can you please try again?"
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