require 'simplecov'
SimpleCov.start

require './potential_resource.rb'

describe PotentialResource do
  context 'when not created' do

    before do
      @potResource = PotentialResource.new
    end

    it 'can be created' do
      expect { @potResource.create('Tester', 1000, 'Lukas') }
        .to change { @potResource.exists? }.from(false).to(true)
    end

    it 'can be created without a name' do
      expect { @potResource.create('Tester', 1000) }
        .to change { @potResource.exists? }.from(false).to(true)
    end
  end

  context 'when creating' do
    before do
      @potResource = PotentialResource.new
      @potResource_other = PotentialResource.new
      @potResource.create('Tester', 1000, 'Lukas')
	  @potResource_other.create('Developer', 1200, 'Jonas')

    end

    it 'gets an id upon creation' do
      expect(@potResource.information('potResource_id')).to_not be_nil
    end

    it 'has an unique id' do
      expect(@potResource.information('potResource_id')).to_not eql(@potResource_other
	  .information('potResource_id'))
    end

    it 'has potential salary grater than zero' do
      expect(@potResource.information('salary')).to be > 0
    end

   end
	
  context 'when created' do
    before do
      @potResource = PotentialResource.new
      @potResource.create('Tester', 1000, 'Lukas')
	  @potResource.add_comment('cool comment')
    end

    it 'information can be edited' do
	  expect { @potResource.edit_info('Tester', 5000, 'Lukas') }
	  .to change { @potResource.information('salary') }
	  .from(1000).to(5000)
    end

    it 'comments can be added' do
      expect { @potResource.add_comment('asdfasdf') }
	  .to change { @potResource.information('comments').length }
	  .from(@potResource.information('comments').length)
	  .to(@potResource.information('comments').length + 1)
    end

    it 'comments can be deleted' do
      expect { @potResource.remove_comment('cool comment') }
	  .to change { @potResource.information('comments').length }
	  .from(@potResource.information('comments').length)
	  .to(@potResource.information('comments').length - 1)
    end
  end
end