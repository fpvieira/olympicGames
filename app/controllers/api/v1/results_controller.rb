module Api
  module V1
    class ResultsController < ApiController
      before_action :set_results_repository
      
      def create
        begin
          #monto o repository de cometição a partir da disciplina
          competitions_repository = CompetitionsRepository.new(params[:discipline_slug])
          competition = competitions_repository.get_by_id(params[:competition_id])
          cumpute_result = ComputeResult.new(competition)
          result = cumpute_result.compute(result_params)
        rescue ActiveRecord::RecordInvalid => invalid
          render json: {"error": invalid.record.errors}, status: :unprocessable_entity
        rescue CompetitionClosedError => competition_close
          render json: {"error": competition_close.message}, status: :service_unavailable
        rescue AlreadyResultError => already_result
          render json: {"error": already_result.message}, status: :conflict
        else
          render json: result, status: :created
        end
      end

      def index
        competitions_repository = CompetitionsRepository.new(params[:discipline_slug])
        competition = competitions_repository.get_by_id(params[:competition_id])
        get_result = GetResult.new(competition)
        result = get_result.execute(result_params)
        render json: result, status: :ok
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