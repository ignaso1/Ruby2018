require 'spec_helper'

describe LeaveNotice do
  context 'when defining its length' do
    let(:leave_notice) do
      described_class.new('lorem', 'impsum', 'sick')
    end

    let(:leave_notice_other) do
      described_class.new('lorem', 'impsum', 'sick')
    end

    let(:date) do
      Date.new(2019, 1, 1)
    end

    let(:date_invalid) do
      Date.new(2010, 1, 1)
    end

    before do
      leave_notice.define_start(date)
      leave_notice.define_finish(10)
    end

    it 'can have a start date' do
      expect(leave_notice.info('leave_start'))
        .not_to be_nil
    end

    it 'can have an end date' do
      expect(leave_notice.info('leave_finish'))
        .not_to be_nil
    end

    it 'has to start in the future' do
      expect(leave_notice.info('leave_start'))
        .to be > Date.today
    end

    it 'has to start before it ends' do
      expect(leave_notice.info('leave_start'))
        .to be < leave_notice.info('leave_finish')
    end

    it 'does not have a start date with incorrect parameters' do
      leave_notice_other.define_start(date_invalid)
      expect(leave_notice_other.info('leave_start')).to be_nil
    end
  end
end
