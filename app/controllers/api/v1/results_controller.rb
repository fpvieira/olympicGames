module Api
  module V1
    class ResultsController < ApiController
      before_action :set_results_repository
      
      def create
        begin
          result = @results_repository.create(result_params)
        rescue ActiveRecord::RecordInvalid => invalid
          render json: {"error": invalid.record.errors}, status: :unprocessable_entity
        else
          render json: result, status: :created
        end
      end

      private
        def result_params
          params.permit(:name,:result,:competition_id,:discipline_slug)
        end

        def set_results_repository
          #NAO CURTI MUITO ISSO
          begin
            @results_repository = ResultsRepository.new(result_params)
          rescue ActiveRecord::RecordNotFound => not_found
            render json: {"error": not_found}, status: :not_found
          end
        end
      # before_action :set_result_interface

      # # GET /api/v1/disciplines/:discipline_slug/competitions/:competition_slug
      # # GET /api/v1/disciplines/one_hundred_metre_dash/competitions/rio_semifinals
      # def index
      #   render json: @result_interface.results
      # end

      # # POST /api/v1/disciplines/:discipline_slug/competitions/:competition_slug
      # # POST /api/v1/disciplines/one_hundred_metre_dash/competitions/rio_semifinals
      # def create
      #   if @result_interface.save(result_params)
      #     render json: @result_interface, status: :created
      #   else
      #     render json: @result_interface.errors, status: :unprocessable_entity
      #   end
      # end

      # private
      #   def result_params
      #     params.permit(:name,:result)
      #   end

      #   def set_result_interface
      #     @result_interface = ResultInterface.new(params)
      #   end
    end
  end
end