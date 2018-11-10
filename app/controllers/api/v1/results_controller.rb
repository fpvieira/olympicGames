module Api
  module V1
    class ResultsController < ApplicationController
      before_action :set_result_interface

      # GET /api/v1/disciplines/:discipline_slug/competitions/:competition_slug
      # GET /api/v1/disciplines/one_hundred_metre_dash/competitions/rio_semifinals
      def index
        render json: @result_interface.results
      end

      # POST /api/v1/disciplines/:discipline_slug/competitions/:competition_slug
      # POST /api/v1/disciplines/one_hundred_metre_dash/competitions/rio_semifinals
      def create
        if @result_interface.save(result_params)
          render json: @result_interface, status: :created
        else
          render json: @result_interface.errors, status: :unprocessable_entity
        end
      end

      private
        def result_params
          params.permit(:name,:result)
        end

        def set_result_interface
          @result_interface = ResultInterface.new(params)
        end
    end
  end
end