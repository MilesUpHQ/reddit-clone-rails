class ReportsController < ApplicationController
  before_action :set_post, only [:create]

  def create
    @report = @post.reports.build report_params
    @report.account_id = current_account.id
    if @report.save
      flash[:notice] = t("report.success")
    else
      flash[:alert] = t("report.error")
    end
    respond_to do |format|
      format.html {  redirect_to community_post_path(@report.post.community_id, @report.post) }
      format.js
    end
  end

  def report_params
    params.require(:report).permit(:report_category_id, :report_reason_id)
  end
end