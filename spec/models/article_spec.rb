require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do 
  let(:article) { build(:article) }
  it "tests that factory is valid" do
    expect(article).to be_valid #article.valid? === true
    article.save!
    another_article = build(:article)
    expect(another_article).not_to be_valid
  end

    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid #article.valid? === true
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'has an invalid content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank") 
    end

    it 'validates slug is unique' do
      a1 = create(:article)
      expect(a1).to be_valid
      a2 = build(:article, slug: a1.slug)
      expect(a2).not_to be_valid
      expect(a2.errors[:slug]).to include('has already been taken')
    end

    it 'returns test in the proper order' do 
      older_article = create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)
      get '/articles'
      ids = json_data.map { |item| item[:id].to_i}
      expect(ids).to(
        eq[recent_article.id, older_article.id]
      )
    end

  end
end
