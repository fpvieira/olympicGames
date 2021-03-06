class ResultsRepository
  
  def initialize(params)
    competitions_repository = CompetitionsRepository.new(params[:discipline_slug])
    @competition = competitions_repository.get_by_id(params[:competition_id])
  end

  def find_by_name_and_competition(params)
    Result.where(name: params[:name],competition_id: params[:competition_id])
  end

  def get(params)
    Result.where(competition_id: params[:competition_id])
  end

  def has_result(params)
    Result.exists?(name: params[:name],competition_id: params[:competition_id])
  end

  def create(params)
    result = Result.new
    result.name = params["name"]
    result.result = params["result"]
    result.competition = @competition
    result.save!
    result
  end
end