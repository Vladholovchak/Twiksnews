# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    @source = create(:source, name: 'google')
    @article = create(:article, source_id: @source.id)
  end

  it 'is valid with valid attributes' do
    expect(@article).to be_valid
  end

  it 'is not valid without a title' do
    sourse2 =  create(:source)
    article2 = build(:article, title: nil, source_id: sourse2.id)
    expect(article2).to_not be_valid
  end

  it 'is not valid without a url' do
    sourse2 =  create(:source)
    article2 = build(:article, url: nil, source_id: sourse2.id)
    expect(article2).to_not be_valid
  end
end
