require 'rails_helper'

describe ApplicationHelper do
  describe '#facebook_like' do
    let(:output) {
      '<div class="fb-like" data-href="page-url" ' \
      'data-layout="button" data-action="like" ' \
      'data-share="false" data-show-faces="false"></div>'
    }

    it 'generate button tag' do
      expect(helper.facebook_like('page-url')).to eq(output)
    end

    it 'should override default options' do
      expect(helper.facebook_like('page-url', share: true)).to have_css('div[data-share="true"]')
    end
  end
end