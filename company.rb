class Company
  def initialize(role_type = 'base')
    @information = { company_id: nil,
                     is_running: false,
					 debt: "0",
					 resources_count: "0",
					 ceo_name: nil,
					 ceo_id: nil,
					 has_ceo: false
					 }
    @information[:role_type] = role_type
  end
  
  def register(company_id, company_name = nil)
    @information[:company_id] = company_id
    @information[:company_name] = company_name
	@information[:is_running] = true
  end
  
  def unregister()
	@information[:is_running] = false
  end
  
  def fireCEO()
	@information[:has_ceo] = false
  end
  
  def registered?
    return true unless @information.fetch(:company_id).equal?(nil)
    false
  end
  
  def placeCEO(ceo_id, ceo_name = nil)
    @information[:ceo_id] = ceo_id
    @information[:ceo_name] = ceo_name
	@information[:has_ceo] = true
  end
  
  def hasCEO?
	return true unless @information.fetch(:has_ceo).equal?(false)
    false
  end
  
  def information(symbol)
    @information.fetch(symbol.to_sym)
  end
  
  def bankrupt?
	return true unless @information.fetch(:debt) < 0
    false
  end
end