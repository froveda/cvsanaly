require 'rails_helper'

describe Commit do
  it "has a valid factory" do
    expect(build(:commit)).to be_valid
  end

  describe "without a repository" do
    let(:object) { build(:commit, repository: nil) }
    it_behaves_like "validating presence", :repository
  end

  describe "without a date" do
    let(:object) { build(:commit, date: nil) }
    it_behaves_like "validating presence", :date
  end

  describe "without a message" do
    let(:object) { build(:commit, message: nil) }
    it_behaves_like "validating presence", :message
  end

  describe "without a committer and author" do
    let(:object) { build(:commit, committer_id: nil, author_id: nil) }
    it_behaves_like "validating presence", :committer_id
    it_behaves_like "validating presence", :author_id
  end

  it "is valid a with a committer and without an author" do
    commit = build(:commit, author_id: nil)
    expect(commit).to be_valid
  end

  it "is valid a without a committer and with an author" do
    commit = build(:commit, committer_id: nil)
    expect(commit).to be_valid
  end

  it "returns a correct title" do
    commit = build(:commit)
    expected_title = "Rev #{commit.rev}"
    expect(commit.title).to eq(expected_title)
  end
end