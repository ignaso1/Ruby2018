require 'spec_helper'

describe Comment do
  context 'when creating' do
    let(:comment) do
      described_class.new('author', 'lorem ipsum')
    end

    let(:comment_other) do
      described_class.new('author_other', 'lorem ipsum')
    end

    it 'gets an id upon creation' do
      expect(comment.information[:id]).not_to be_nil
    end

    it 'has a unique id' do
      expect(comment.information[:id]).not_to be(comment_other.information[:id])
    end

    it 'gets current date upon creation' do
      expect(comment.information[:creation_date].to_s).to eq(Date.today.to_s)
    end

    it 'has an author' do
      expect(comment.information[:author]).not_to be_nil
    end

    it 'has content' do
      expect(comment.information[:content]).not_to be_nil
    end
  end
end
