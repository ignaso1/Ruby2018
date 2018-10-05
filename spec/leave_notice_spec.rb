require 'spec_helper'

describe LeaveNotice do
  context 'when defining its length' do
    before do
      @leave_notice = LeaveNotice.new('lorem', 'impsum', 'sick')
      @leave_notice.define_start(2019, 1, 1)
      @leave_notice.define_finish(10)
    end

    it 'can have a start date' do
      expect(@leave_notice.info('leave_start'))
        .to_not be_nil
    end

    it 'can have an end date' do
      expect(@leave_notice.info('leave_finish'))
        .to_not be_nil
    end

    it 'has to start in the future' do
      expect(@leave_notice.info('leave_start'))
        .to be > Date.today
    end

    it 'has to start before it ends' do
      expect(@leave_notice.info('leave_start'))
        .to be < @leave_notice.info('leave_finish')
    end

    it 'does not have a start date with incorrect parameters' do
      @leave_notice_other = LeaveNotice.new('lorem', 'impsum', 'sick')
      @leave_notice_other.define_start(2010, 1, 1)
      expect(@leave_notice_other.info('leave_start')).to be_nil
    end
  end
end
