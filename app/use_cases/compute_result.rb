class ComputeResult
  def initialize(competition)
    @competition = competition
  end

  def compute(params)
    raise CompetitionClosedError if not @competition.opened
    rule = @competition.discipline.rule_type.constantize.new(params)
    rule.add_result(params)
  end
end