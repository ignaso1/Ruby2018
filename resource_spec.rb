require 'simplecov'
SimpleCov.start

require './resource.rb'

describe Resource do
  context 'when creating' do
    before do
      @resource = Resource.new('lorem', 'ipsum')
      @resource_other = Resource.new('lorem', 'ipsum')
    end

    it 'gets a resource id upon creation' do
      expect(@resource.info('resource_id')).to_not be_nil
    end

    it 'gets a name upon creation' do
      expect(@resource.info('name')).to_not be_nil
    end

    it 'gets a last name upon creation' do
      expect(@resource.info('last_name')).to_not be_nil
    end

    it 'has a unique id' do
      expect(@resource.info('resource_id'))
        .to_not eql(@resource_other.info('resource_id'))
    end
  end
end
