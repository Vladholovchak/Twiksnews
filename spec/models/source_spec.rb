# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Source, type: :model do

  before(:all) do
    @source1 = create(:source)
  end

  it "is valid with valid attributes" do
    expect(@source1).to be_valid
  end

  it "is not valid without a name" do
    sourse2 = build(:source, name: nil )
    expect(sourse2).to_not be_valid
  end


  it "calculates amount of articles from source" do
  end

end
