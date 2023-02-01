class ReportsController < ApplicationController
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
    params.require(:report).permit(:title, :description)
  end
end
