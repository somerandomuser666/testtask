class BaseService
  def self.call(**args)
    new.call(**args)
  end
end
