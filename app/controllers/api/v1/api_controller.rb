module Api::V1
  class ApiController < ApplicationController
    ActionController::Parameters.action_on_unpermitted_parameters = :raise
    rescue_from(ActionController::UnpermittedParameters) do |pme|
      render json: { error:  { unknown_parameters: pme.params } }, status: :bad_request
    end
    # acts_as_token_authentication_handler_for User
    # #Vai validar se o usuário existe, mas não faz a autenticação
    # before_action :require_authentication!
    # #Recomendação do devise baseada no current user, que é o que retorna o método antigo
 
    # private
    #   def require_authentication!
    #     throw(:warden, scope: :user) unless current_user.presence
    #   end
    end
 end