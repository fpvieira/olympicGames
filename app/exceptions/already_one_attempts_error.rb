class AlreadyOneAttemptsError < StandardError
  def message
    "already one attempts for this athlete"
  end
end