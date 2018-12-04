# frozen_string_literal: true

# require 'rails_helper'

# describe Comment do
#   context 'when creating' do
#     let(:comment) do
#       described_class.new('author', 'lorem ipsum')
#     end

#     let(:comment_other) do
#       described_class.new('author_other', 'lorem ipsum')
#     end

#     it 'gets an id upon creation' do
#       expect(comment.information[:id]).not_to be_nil
#     end

#     it 'has a unique id' do
#       expect(comment.information[:id])
#           .not_to be(comment_other.information[:id])
#     end

#     it 'gets current date upon creation' do
#       expect(comment.information[:creation_date].to_s).to eq(Date.today.to_s)
#     end

#     it 'has an author' do
#       expect(comment).to have_an_author('author')
#     end

#     it 'has content' do
#       expect(comment.information[:content]).to eq('lorem ipsum')
#     end

#     it 'has valid data' do
#       expect(comment).to comment_valid('author', 'lorem ipsum')
#     end
#   end
# end
