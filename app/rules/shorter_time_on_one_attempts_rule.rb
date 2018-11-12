class ShorterTimeOnOneAttemptsRule
  def initialize(params)
    @results_repository = ResultsRepository.new(params)
  end

  def add_result(params)
    raise AlreadyOneAttemptsError if @results_repository.has_result(params)
    @results_repository.create(params)
  end

  def get_result(params)
    results_by_repository = @results_repository.get(params)
    results_sorted = results_by_repository.sort_by{ |result| result.result }
    results = []
    results_sorted.each do |result_sorted|
      results_by_player = []
      results_by_player << result_sorted.result
      player = {"id": result_sorted.id, 
                "name": result_sorted.name, 
                "result": results_by_player,
                "competition_id": result_sorted.competition_id}
      results << player
    end
    results
  end
end