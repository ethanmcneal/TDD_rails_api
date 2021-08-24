require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do 
  it "tests that factory is valid" do
    let(:article) { create(:article) }
    expect(article).to be_valid #article.valid? === true
  end

    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid #article.valid? === true
      expect(article.errors[:title]). to include("can't be blank")
    end
  end
end
