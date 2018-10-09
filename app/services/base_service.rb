class BaseService
  def self.call(**args)
    new.call(**args)
    true
  rescue
    false
  end
end
