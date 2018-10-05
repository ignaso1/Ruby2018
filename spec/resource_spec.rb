require 'spec_helper'

describe Resource do
  context 'when creating' do
    let(:resource) do
      described_class.new('lorem', 'ipsum')
    end

    let(:resource_other) do
      described_class.new('lorem', 'ipsum')
    end

    it 'gets a resource id upon creation' do
      expect(resource.info('resource_id')).not_to be_nil
    end

    it 'gets a name upon creation' do
      expect(resource.info('name')).not_to be_nil
    end

    it 'gets a last name upon creation' do
      expect(resource.info('last_name')).not_to be_nil
    end

    it 'has a unique id' do
      expect(resource.info('resource_id'))
        .not_to eql(resource_other.info('resource_id'))
    end
  end
end
