module Api
  module V1
    class DisciplinesController < ApiController
      before_action :set_disciplines_repository

      # GET /api/v1/disciplines
      def index
        render json: @disciplines_repository.list_ordered_by_desc, except: [:created_at, :updated_at]
      end

      private
        def set_disciplines_repository
          @disciplines_repository = DisciplinesRepository.new
        end
    end
  end
end
