class TransferencesController < ApplicationController
  
  def create
    
    @transference = Transference.new(transference_params)
    if @transference.save
      Transference.transfer
      render json: @transference, status: :created
    else
      render json: @transference.errors, status: :unprocessable_entity
    end
  end

  private

  def transference_params
    params.require(:transference).permit(:amount, :account_source_id, :account_destination_id)
  end
end