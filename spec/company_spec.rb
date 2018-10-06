require 'spec_helper'

describe Company do
  context 'when not registered' do
    let(:company) do
      described_class.new
    end

    it 'can register' do
      expect { company.register('id-1', 'google') }
        .to change(company, :registered?).from(false).to(true)
    end

    it 'can register without a name' do
      expect { company.register('id-1') }
        .to change(company, :registered?).from(false).to(true)
    end
  end

  context 'when has ceo' do
    let(:company) do
      described_class.new
    end

    before do
      company.register('id-1', 'google')
    end

    it 'can hire' do
      expect { company.place_ceo('f-1', 'steve jobs') }
        .to change(company, :ceo?).from(false).to(true)
    end

    it 'can fire' do
      company.place_ceo('f-1', 'steve jobs')
      expect { company.fire_ceo }
        .to change(company, :ceo?).from(true).to(false)
    end
  end

  context 'when registering' do
    let(:company) do
      described_class.new('uab')
    end

    let(:company_other) do
      described_class.new('uab')
    end

    before do
      company.register('id-1', 'google')
      company.register('id-2', 'google')
    end

    it 'gets a company id upon registration' do
      expect(company.information('company_id')).not_to be_nil
    end

    it 'has a unique company id' do
      expect(company.information('company_id'))
        .not_to eql(company_other.information('company_id'))
    end

    it 'has an role type' do
      expect(company.information('role_type')).to eql('uab')
    end

    it 'can have a different role type' do
      expect(company_other.information('role_type')).to eql('uab')
    end

    it 'can see their name' do
      expect(company.information('company_name')).to eql('google')
    end

    it 'can see their id' do
      expect(company.information('company_id')).to eql('id-2')
    end

    it 'can see their debt' do
      expect(company.information('debt')).to be(0)
    end

    it 'can bankrupt' do
      expect { company.add_debt(-10) }
        .to change(company, :bankrupt?).from(false).to(true)
    end

    it 'can unregister' do
      expect { company.unregister }
        .to change { company.information('is_running') }.from(true).to(false)
    end
  end
end
