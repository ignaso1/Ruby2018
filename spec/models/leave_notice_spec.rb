# frozen_string_literal: true

# require 'rails_helper'

# describe LeaveNotice do
#   context 'when defining its properties' do
#     let(:leave_notice) do
#       described_class.new('sick')
#     end

#     it 'can have a start date' do
#       expect(leave_notice.information.key?(:start)).to be true
#     end

#     it 'can have a finish date' do
#       expect(leave_notice.information.key?(:finish)).to be true
#     end

#     it 'can have a type' do
#       expect(leave_notice.information.key?(:type)).to be true
#     end

#     it 'can define the type' do
#       expect(leave_notice.information[:type]).to match('sick')
#     end

#     it 'can have a unique id' do
#       expect(leave_notice.information[:id]).to be(leave_notice.itself)
#     end
#   end

#   context 'when defining its length' do
#     let(:leave_notice) { described_class.new('sick') }
#     let(:leave_notice_other) { described_class.new('sick') }
#     let(:date) { Date.new(2019, 2, 1) }
#     let(:date_invalid) { Date.today }

#     before do
#       leave_notice.define_start(date)
#       leave_notice.define_finish(10)
#     end

#     it 'has valid data' do
#       expect(leave_notice).to leave_notice_valid(date, 10)
#     end

#     it 'has to start in the future' do
#       expect(leave_notice.information[:start])
#         .to be > Date.today
#     end

#     it 'has to start before it ends' do
#       expect(leave_notice.information[:start])
#         .to be < leave_notice.information[:finish]
#     end

#     it 'does not have an end date with incorrect length' do
#       expect { leave_notice.define_finish(-100) }
#         .not_to(change { leave_notice.information[:finish] })
#     end

#     it 'does not have a start date with incorrect parameters' do
#       leave_notice_other.define_start(date_invalid)
#       expect(leave_notice_other.information[:start]).to be_nil
#     end
#   end
# end
