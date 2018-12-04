# frozen_string_literal: true

# require 'rails_helper'

# describe Company do
#   context 'when not registered' do
#     let(:ceo) { Ceo.new(10) }
#     let(:company) { described_class.new(ceo) }
#     let(:company_other) { described_class.new(ceo) }
#     let(:company_invalid) { described_class.new('ceo') }

#     it 'can have a name' do
#       expect(company.information).to include(:name)
#     end

#     it 'can have an id' do
#       expect(company.information).to include(:id)
#     end

#     it 'can have debt' do
#       expect(company.information).to include(:debt)
#     end

#     it 'does have a ceo' do
#       expect(company.information[:ceo]).to be(ceo)
#     end

#     it 'does not have a ceo with wrong parameters' do
#       expect(company_invalid.information).not_to include(:ceo)
#     end

#     it 'does not have resources' do
#       expect(company.resources).to all(be_nil)
#     end

#     it 'can register' do
#       expect { company.register('company') }
#         .to change(company, :registered?).from(false).to(true)
#     end

#     it 'cant change name' do
#       expect { company.change_name('company_new') }
#         .not_to(change { company.information[:name] })
#     end

#     it 'cant be running' do
#       expect(company_other.running?).to be false
#     end
#   end

#   context 'when registered' do
#     let(:ceo) { Ceo.new(10) }
#     let(:new_ceo) { Ceo.new(1) }
#     let(:company) { described_class.new(ceo) }
#     let(:resource) { Resource.new('lorem', 'ipsum') }

#     before do
#       company.register('company')
#     end

#     it 'does not have debt' do
#       expect(company).to not_have_debt
#     end

#     it 'can have resources' do
#       expect(company.resources).to contain_exactly
#     end

#     it 'can change its name' do
#       expect { company.change_name('company_new') }
#         .to change { company.information[:name] }
#         .from('company').to('company_new')
#     end

#     it 'cant register again' do
#       expect { company.register('company_other') }
#         .not_to change(company, :information)
#     end

#     it 'can add resources' do
#       company.resources << resource
#       expect(company.resources).to include(resource)
#     end

#     it 'cant assign a new ceo if its not a ceo' do
#       expect { company.replace_ceo('ceo') }
#         .not_to(change { company.information[:ceo] })
#     end

#     it 'can replace ceo' do
#       expect { company.replace_ceo(new_ceo) }
#         .to change { company.information[:ceo] }
#         .from(ceo).to(new_ceo)
#     end

#     it 'can unregister' do
#       company.unregister
#       expect(company.information[:id]).not_to match(company.itself)
#     end

#     it 'can be not bankrupt' do
#       expect(company.bankrupt?).to be false
#     end

#     it 'can be running' do
#       expect(company.running?).to be true
#     end

#     it 'cant be running if its bankrupt' do
#       company.information[:debt] = 200_000
#       expect(company.running?).to be false
#     end
#   end

#   context 'when unregistering' do
#     let(:ceo) { Ceo.new(10) }
#     let(:company) { described_class.new(ceo) }
#     let(:resource) { Resource.new('lorem', 'ipsum') }

#     before do
#       company.register('company')
#       company.information[:debt] = 10
#     end

#     it 'does not have resources' do
#       company.resources << resource
#       expect { company.unregister }
#         .to change { company.resources[0] }
#         .from(resource).to(nil)
#     end

#     it 'does not have a name' do
#       expect { company.unregister }
#         .to change { company.information[:name] }
#         .from('company').to(nil)
#     end

#     it 'does not have an id' do
#       expect { company.unregister }
#         .to change { company.information[:id] }
#         .from(company.itself).to(nil)
#     end

#     it 'does not have debt' do
#       expect { company.unregister }
#         .to change { company.information[:debt] }
#         .from(company.information[:debt]).to(0)
#     end
#   end
# end
