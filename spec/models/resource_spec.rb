# require 'rails_helper'

# describe Resource do
#   context 'when creating' do
#     let(:resource) do
#       described_class.new('lorem', 'ipsum')
#     end

#     let(:resource_other) do
#       described_class.new('lorem', 'ipsum')
#     end

#     it 'gets a resource id upon creation' do
#       expect(resource.information[:id]).to eq(resource.itself)
#     end

#     it 'gets a name upon creation' do
#       expect(resource.information[:name]).to eq('lorem')
#     end

#     it 'can have a position assigned' do
#       expect(resource.information.key?(:position)).to be true
#     end

#     it 'can have a birthday assigned' do
#       expect(resource.information.key?(:birthday)).to be true
#     end

#     it 'can have a salary assigned' do
#       expect(resource.information.key?(:salary)).to be true
#     end

#     it 'gets a last name upon creation' do
#       expect(resource.information[:last_name]).to eq('ipsum')
#     end

#     it 'has a unique id' do
#       expect(resource.information[:id])
#         .not_to eql(resource_other.information[:id])
#     end
#   end

#   context 'when managing leave notices and comments' do
#     let(:resource) { described_class.new('lorem', 'impsum') }
#     let(:leave_notice) { LeaveNotice.new('sick') }
#     let(:comment) { Comment.new('lorem', 'ipsum') }
#     let(:comment_other) { Comment.new('lorem2', 'ipsum2') }

#     it 'can have a leave notice' do
#       resource.leave_notices << leave_notice
#       expect(resource.leave_notices[0]).to be(leave_notice)
#     end

#     it 'can have a comment' do
#       resource.comments << comment
#       expect(resource.comments[0]).to eq(comment)
#     end

#     it 'can have multiple comments' do
#       resource.comments << comment
#       resource.comments << comment_other
#       expect(resource.comments).to valid_comments(comment, comment_other)
#     end
#   end
# end