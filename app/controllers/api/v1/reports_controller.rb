class Api::V1::ReportsController < ApplicationController
  before_action :set_report, only: %i[show update destroy close]
  
  
  def index
    @report = Report.all
    render json: @report
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def set_post
    @report = Report.find(params[:id])
  end

  private

  def report_params
    params.require(:report).permit(:account_id, :post_id, :community_id, :report_categories_name, :report_category_id, :report_reason_id, :report_reason_name)
  end
end
