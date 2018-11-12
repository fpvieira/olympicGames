class AlreadyThreeAttemptsError < StandardError
  def message
    "already three attempts for this athlete"
  end
end