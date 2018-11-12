class LongestThrownOnThreeAttemptsRule
  def initialize(params)
    @results_repository = ResultsRepository.new(params)
  end

  def add_result(params)
    raise AlreadyThreeAttemptsError if already_three_attempts?(params)
    @results_repository.create(params)
  end

  def get_result(params)
    results_by_repository = @results_repository.get(params)
    results_sorted = results_by_repository.sort_by{ |results_by_repository| results_by_repository.result }.reverse!
    results = []
    results_sorted.each do |result_sorted|
      if results.any? { |result| result[:name] == result_sorted.name }
        results.find { |result| result[:name] == result_sorted.name}[:result] << result_sorted.result
      else
        results_by_player = []
        results_by_player << result_sorted.result
        player = {"id": result_sorted.id, 
                  "name": result_sorted.name, 
                  "result": results_by_player,
                  "competition_id": result_sorted.competition_id}
        results << player
      end
    end
    results
  end

  def already_three_attempts?(params)
    @results_repository.find_by_name_and_competition(params).size >= 3
  end
end