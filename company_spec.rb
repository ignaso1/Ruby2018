require 'simplecov'
SimpleCov.start

require './company.rb'

describe Company do
  context 'when not registered' do

    before do
      @company = Company.new
    end

    it 'can register' do
      expect { @company.register('id-1', 'google') }
        .to change { @company.registered? }.from(false).to(true)
    end

    it 'can register without a name' do
      expect { @company.register('id-1') }
        .to change { @company.registered? }.from(false).to(true)
    end
  end
  
  context 'ceo' do
	before do
      @company = Company.new
      @company.register('id-1', 'google')
      @company = Company.new('uab')
    end
	
	it 'can hire' do
      expect { @company.placeCEO('steve jobs') }
        .to change { @company.hasCEO? }.from(false).to(true)
    end
	
	it 'can fire' do
      expect { @company.placeCEO('steve jobs') }
        .to change { @company.hasCEO? }.from(false).to(true)
    end
  end

  context 'when registering' do
    before do
      @company = Company.new
      @company.register('id-1', 'google')
      @company = Company.new('uab')
    end

    it 'gets a company id upon registration' do
      expect(@company.information('company_id')).to_not be_nil
    end

    it 'has a unique company id' do
      expect(@company.information('company_id')).to_not eql(@company_other
                                                        .information('company_id'))
    end

    it 'has an role type' do
      expect(@company.information('role_type')).to eql('uab')
    end

    it 'can have a different role type' do
      expect(@company_other.information('role_type')).to eql('uab')
    end

    it 'can see their name' do
      expect(@company.information('company_name')).to eql('google')
    end

    it 'can see their id' do
      expect(@company.information('company_id')).to eql('id-1')
    end

    it 'can see their debt' do
      expect(@company.information('debt')).to eql('0')
    end

    it 'can unregister' do
      expect { @company.fireCEO }.to change { @company.information('has_ceo') }
        .from(true).to(false)
    end
  end
end