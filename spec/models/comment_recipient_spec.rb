# frozen_string_literal: true

# require 'rails_helper'

# describe CommentRecipient do
#   context 'when created' do
#     let(:comment) { Comment.new('manager', 'lorem ipsum') }
#     let(:project) { Project.new('project', 10) }
#     let(:resource) { Resource.new('name', 'lastname') }
#     let(:comment_recipient) do
#       described_class.new(comment, project, resource)
#     end

#     let(:comment_recipient_invalid) do
#       described_class.new(project, resource, comment)
#     end

#     it 'can have a comment' do
#       expect(comment_recipient).to have_comment(comment)
#     end

#     it 'has a recipient that is a project' do
#       expect(comment_recipient.project).to eq(project)
#     end

#     it 'has a recipient that is a resource' do
#       expect(comment_recipient.resource).to eq(resource)
#     end

#     it 'has comment value nil with wrong parameters' do
#       expect(comment_recipient_invalid.comment).to be_a(NilClass)
#     end

#     it 'has project value nil with wrong parameters' do
#       expect(comment_recipient_invalid.project).to eq(nil)
#     end

#     it 'has resource value nil with wrong parameters' do
#       expect(comment_recipient_invalid.resource).to eq(nil)
#     end
#   end
# end
