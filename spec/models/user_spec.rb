require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { described_class.new(name: name, email: email, password: password) }
  let(:name) { 'たかしょー' }
  let(:email) { 'takasho@gmail.com' }
  let(:password) { '12345678' }

  describe '#valid?' do
    subject { user.valid? }
    context 'データが全て入っている場合' do
      it { is_expected.to be_truthy }
    end
    context '名前がnilの場合' do
      let(:name) { nil }
      it { is_expected.to be_falsy }
    end
  end
end
