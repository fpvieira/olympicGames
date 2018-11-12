module Api
  module V1
    class CompetitionsController < ApiController
      before_action :set_competitions_repository

      def create
        begin
          competition = @competitions_repository.create(competition_params)
        rescue ActiveRecord::RecordInvalid => invalid
          render json: {"error": invalid.record.errors}, status: :unprocessable_entity
        else
          render json: competition, status: :created
        end
      end

      def finish
        begin
          competition = @competitions_repository.finish(params[:id])
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

        def set_competitions_repository
          begin
            @competitions_repository = CompetitionsRepository.new(params[:discipline_slug])
          rescue ActiveRecord::RecordNotFound => not_found
            render json: {"error": not_found}, status: :not_found
          end
        end
    end
  end
end