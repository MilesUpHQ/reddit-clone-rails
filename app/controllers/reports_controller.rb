class ReportsController < ApplicationController
  def create
    @report = @post.reports.build report_params
    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  private

  def report_params
    params.require(:report).permit(:report_category_id, :report_reason_id)
  end
end
