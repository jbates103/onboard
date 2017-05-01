module AppHelper
  def lower_env
  	[:dt, :pt, :dm].sample
  end

  def higher_env
  	[:preprod, :prod].sample
  end

  def status_enum
  	[:not_started, :in_progress, :blocked, :completed, :done, :accepted].sample
  end
end