module Api
  module V1
    class DisciplinesController < ApiController
      before_action :set_discipline_repository

      # GET /api/v1/disciplines
      def index
        render json: @discipline_repository.list_ordered_by_desc, except: [:created_at, :updated_at]
      end

      private
        def set_discipline_repository
          @discipline_repository = DisciplineRepository.new
        end
    end
  end
end
