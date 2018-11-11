class ShorterTimeRule
  def initialize(params)
    @results_repository = ResultsRepository.new(params)
  end

  def add_result(params)
    raise AlreadyResultError if @results_repository.has_result(params)
    @results_repository.create(params)
  end
end