class ResultsRepository
  
  def initialize(params)
    competitions_repository = CompetitionsRepository.new(params[:discipline_slug])
    @competition = competitions_repository.get_by_id(params[:competition_id])
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