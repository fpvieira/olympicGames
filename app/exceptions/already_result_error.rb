class AlreadyResultError < StandardError
  def message
    "already has result for this athlete"
  end
end