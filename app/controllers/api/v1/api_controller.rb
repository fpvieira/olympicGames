module Api::V1
  class ApiController < ApplicationController
    ActionController::Parameters.action_on_unpermitted_parameters = :raise
        rescue_from(ActionController::UnpermittedParameters) do |pme|
          render json: { error:  { unknown_parameters: pme.params } }, status: :bad_request
        end
    end
 end