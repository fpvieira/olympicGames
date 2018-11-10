module Api
  module V1
    class CompetitionsController < ApiController
      before_action :set_competition_repository

      def index
        render json: @competition_repository.list_ordered_by_desc
      end

      def create
        begin
          competition = @competition_repository.create(competition_params)
        rescue ActiveRecord::RecordInvalid => invalid
          render json: {"error": invalid.record.errors}, status: :unprocessable_entity
        else
          render json: competition, status: :created
        end
      end

      def show
        begin
          competition = @competition_repository.get_by_id(params[:id])
        rescue ActiveRecord::RecordNotFound => not_found
          render json: {"error": not_found}, status: :not_found
        else
          render json: competition, status: :ok
        end
      end

      def finish
        begin
          competition = @competition_repository.finish(params[:id])
        rescue ActiveRecord::RecordNotFound => not_found
          render json: {"error": not_found}, status: :not_found
        else
          render json: competition, status: :ok
        end
      end 
      
      private
        def competition_params
          params.permit(:name,:discipline_slug)
        end

        def set_competition_repository
          #NAO CURTI MUITO ISSO
          begin
            @competition_repository = CompetitionRepository.new(params[:discipline_slug])
          rescue ActiveRecord::RecordNotFound => not_found
            render json: {"error": not_found}, status: :not_found
          end
        end
    end
  end
end