class CompetitionClosedError < StandardError
  def message
    "competition is closed"
  end
end