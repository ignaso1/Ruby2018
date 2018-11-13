class Ceo < User
    attr_reader :salary
    def initialize(salary = 1)
      super('Ceo')
      @salary = salary if salary.positive?
    end
  
    def adjust_salary(salary)
      @salary = salary if salary.positive?
    end
  end