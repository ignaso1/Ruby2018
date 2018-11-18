# require 'rails_helper'

# describe Ceo do
#   context 'when created' do
#     let(:ceo) { described_class.new(10) }
#     let(:ceo_invalid) { described_class.new(-10) }
#     let(:ceo_default) { described_class.new }

#     it 'can have a salary' do
#       expect(ceo).to have_attributes(salary: 10)
#     end

#     it 'has 1 salary without params' do
#       expect(ceo_default).to have_attributes(salary: 1)
#     end

#     it 'does not have a salary with wrong parameters' do
#       expect(ceo_invalid).not_to have_attributes(salary: -10)
#     end

#     it 'has user information' do
#       expect(ceo.information('role_type')).to eq('Ceo')
#     end
#   end

#   context 'when adjusting salary can' do
#     let(:ceo) { described_class.new }

#     it 'change it' do
#       expect { ceo.adjust_salary(10) }
#         .to change(ceo, :salary)
#         .from(1).to(10)
#     end

#     it 'not change it to negative' do
#       expect { ceo.adjust_salary(-10) }
#         .not_to change(ceo, :salary)
#     end
#   end
# end