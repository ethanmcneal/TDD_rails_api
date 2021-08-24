FactoryBot.define do
  factory :article do |n|
    title { "Sample Article" }
    content { "Sample Content" }
    slug { "#{n}-sample-article" }
  end
end
