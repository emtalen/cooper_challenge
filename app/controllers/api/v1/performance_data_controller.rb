class Api::V1::PerformanceDataController < ApplicationController
  before_action :authenticate_user!

  def create
    binding.pry
    data = PerformanceData.new(performance_data_params.merge!(user: current_user))

    if data.save
      binding.pry
      head :ok
    else
      render json: { error: data.errors.full_messages }
    end
  end

  def index
    collection = current_user.performance_data
    render json: { entries: collection }
  end


  private

  def performance_data_params
    params.require(:performance_data).permit!
  end
end

