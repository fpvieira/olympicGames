class GetResult
  def initialize(competition)
    @competition = competition
  end

  def execute(params)
    # raise CompetitionClosedError if not @competition.opened
    rule = @competition.discipline.rule_type.constantize.new(params)
    rule.get_result(params)
  end
end