class ResultRepository
  
  def initialize(discipline_slug)
    competition_repository = CompetitionRepository.new
    @competition = competition_repository.get_by_id(competition_id)
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