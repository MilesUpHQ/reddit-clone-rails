class ReportsController < ApplicationController
  def create
    report = Report.new (report_params)
    if report.save 
      flash[:notice] = "Post reported"
      respond_to do |format|
        format.js
        format.html {  redirect_to post_path(report.post_id, report.post) }
      end
    else
      render "form"
    end
  end

  def report_params
    params.require(:report).permit(:post_id, :account_id, :report_category_id, :report_reason_id)
  end
end