class GetResultCommand
  def initialize(competition)
    @competition = competition
  end

  def execute(params)
    rule = @competition.discipline.rule_type.constantize.new(params)
    rule.get_result(params)
  end
end