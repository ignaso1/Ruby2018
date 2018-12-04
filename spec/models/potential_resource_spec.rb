# frozen_string_literal: true

# require 'rails_helper'

# describe PotentialResource do
#   context 'when not created' do
#     let(:potential_resource) do
#       described_class.new
#     end

#     it 'can have an id' do
#       expect(potential_resource.information('id')).to be nil
#     end

#     it 'can have a position' do
#       expect(potential_resource.information('position')).to be nil
#     end

#     it 'can have a full_name' do
#       expect(potential_resource.information('full_name')).to be nil
#     end

#     it 'can be created' do
#       expect { potential_resource.create('Tester', 1000, 'Lukas') }
#         .to change(potential_resource, :exists?).from(false).to(true)
#     end

#     it 'can be created without a name' do
#       expect { potential_resource.create('Tester', 1000) }
#         .to change(potential_resource, :exists?).from(false).to(true)
#     end

#     it 'can enter a name upon creation' do
#       expect { potential_resource.create('Tester', 1000, 'Name') }
#         .to change { potential_resource.information('full_name') }
#         .from(nil).to('Name')
#     end

#     it 'must specify a position on creation' do
#       expect { potential_resource.create('Tester', 1000) }
#         .to change { potential_resource.information('position') }
#         .from(nil).to('Tester')
#     end
#   end

#   context 'when creating' do
#     let(:potential_resource) do
#       described_class.new
#     end

#     let(:potential_resource_other) do
#       described_class.new
#     end

#     before do
#       potential_resource.create('Tester', 1000, 'Lukas')
#       potential_resource_other.create('Developer', 1200, 'Jonas')
#     end

#     it 'has to exist' do
#       expect(potential_resource.exists?).to be true
#     end

#     it 'gets an id upon creation' do
#       expect(potential_resource.information('id')).not_to be_nil
#     end

#     it 'gets a salary upon creation' do
#       expect(potential_resource.information('salary')).to eq(1000)
#     end

#     it 'gets a position upon creation' do
#       expect(potential_resource.information('position')).to eq('Tester')
#     end

#     it 'has an unique id' do
#       expect(potential_resource.information('id'))
#         .not_to eql(potential_resource_other
#         .information('id'))
#     end

#     it 'has potential salary greater than zero' do
#       expect(potential_resource.information('salary')).to be > 0
#     end
#   end

#   context 'when created' do
#     let(:potential_resource) do
#       described_class.new
#     end

#     before do
#       potential_resource.create('Tester', 1000, 'Lukas')
#       potential_resource.add_comment('cool comment')
#     end

#     it 'information can be edited' do
#       expect { potential_resource.edit_info('salary', 5000) }
#         .to change { potential_resource.information('salary') }
#         .from(1000).to(5000)
#     end

#     it 'comments can be added' do
#       expect { potential_resource.add_comment('asdfasdf') }
#         .to change { potential_resource.information('comments').length }
#         .from(potential_resource.information('comments').length)
#         .to(potential_resource.information('comments').length + 1)
#     end

#     it 'comments can be deleted' do
#       expect { potential_resource.remove_comment('cool comment') }
#         .to change { potential_resource.information('comments').length }
#         .from(potential_resource.information('comments').length)
#         .to(potential_resource.information('comments').length - 1)
#     end
#   end
# end
