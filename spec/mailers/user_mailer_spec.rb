require "rails_helper"

describe UserMailer do
  describe '#subscribed' do
    let(:user) { User.create(email: 'test@email.com') }
    let(:mail) { described_class.subscribed(user) }

    it { expect(mail.subject).to eq(I18n.t('email_subject')) }
    it { expect(mail.to).to eq([user.email]) }
    it { expect(mail.from).to eql(['contact@seshook.com']) }
    it { expect(mail.body.encoded).to match(user.email) }
  end
end