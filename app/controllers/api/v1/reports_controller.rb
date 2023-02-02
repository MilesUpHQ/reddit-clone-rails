class Api::V1::ReportsController < ApplicationController
  
  
  def index
    @reports = Report.all
    render json: @reports
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  private

  def report_params
    params.require(:report).permit(:account_id, :post_id, :community_id,:report_category_id, :report_reason_id)
  end
end
