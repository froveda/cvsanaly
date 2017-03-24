require 'rails_helper'

describe Metric do
  it "has a valid factory" do
    expect(build(:metric)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:commit) }
    it { is_expected.to validate_presence_of(:file) }
    it { is_expected.to validate_presence_of(:lang) }
    it { is_expected.to validate_numericality_of(:halstead_length).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:halstead_level).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:halstead_md).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:halstead_vol).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:lblank).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:lcomment).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:loc).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:mccabe_max).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:mccabe_mean).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:mccabe_median).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:mccabe_min).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:mccabe_sum).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:ncomment).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:nfunctions).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:sloc).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_numericality_of(:halstead_level).is_greater_than_or_equal_to(0).allow_nil }
  end

  describe "without a commit" do
    let(:object) { build(:metric, commit: nil) }
    it_behaves_like "validating presence", :commit
  end

  describe "without a file" do
    let(:object) { build(:metric, file: nil) }
    it_behaves_like "validating presence", :file
  end

  describe "without a lang" do
    let(:object) { build(:metric, lang: nil) }
    it_behaves_like "validating presence", :lang
  end

  describe "when halstead_length is not a number" do
    let(:object) { build(:metric, halstead_length: 'a') }
    it_behaves_like "validating that is a number", :halstead_length
  end

  describe "when halstead_length is a number less than 0" do
    let(:object) { build(:metric, halstead_length: -1) }
    it_behaves_like "validating number greater than or equal to a count", :halstead_length, 0
  end

  describe "when halstead_level is not a number" do
    let(:object) { build(:metric, halstead_level: 'a') }
    it_behaves_like "validating that is a number", :halstead_level
  end

  describe "when halstead_level is a number less than 0" do
    let(:object) { build(:metric, halstead_level: -1) }
    it_behaves_like "validating number greater than or equal to a count", :halstead_level, 0
  end

  describe "when halstead_md is not a number" do
    let(:object) { build(:metric, halstead_md: 'a') }
    it_behaves_like "validating that is a number", :halstead_md
  end

  describe "when halstead_md is a number less than 0" do
    let(:object) { build(:metric, halstead_md: -1) }
    it_behaves_like "validating number greater than or equal to a count", :halstead_md, 0
  end

  describe "when halstead_vol is not a number" do
    let(:object) { build(:metric, halstead_vol: 'a') }
    it_behaves_like "validating that is a number", :halstead_vol
  end

  describe "when halstead_vol is a number less than 0" do
    let(:object) { build(:metric, halstead_vol: -1) }
    it_behaves_like "validating number greater than or equal to a count", :halstead_vol, 0
  end

  describe "when lblank is not a number" do
    let(:object) { build(:metric, lblank: 'a') }
    it_behaves_like "validating that is a number", :lblank
  end

  describe "when lblank is a number less than 0" do
    let(:object) { build(:metric, lblank: -1) }
    it_behaves_like "validating number greater than or equal to a count", :lblank, 0
  end

  describe "when lcomment is not a number" do
    let(:object) { build(:metric, lcomment: 'a') }
    it_behaves_like "validating that is a number", :lcomment
  end

  describe "when lcomment is a number less than 0" do
    let(:object) { build(:metric, lcomment: -1) }
    it_behaves_like "validating number greater than or equal to a count", :lcomment, 0
  end

  describe "when loc is not a number" do
    let(:object) { build(:metric, loc: 'a') }
    it_behaves_like "validating that is a number", :loc
  end

  describe "when loc is a number less than 0" do
    let(:object) { build(:metric, loc: -1) }
    it_behaves_like "validating number greater than or equal to a count", :loc, 0
  end

  describe "when mccabe_max is not a number" do
    let(:object) { build(:metric, mccabe_max: 'a') }
    it_behaves_like "validating that is a number", :mccabe_max
  end

  describe "when mccabe_max is a number less than 0" do
    let(:object) { build(:metric, mccabe_max: -1) }
    it_behaves_like "validating number greater than or equal to a count", :mccabe_max, 0
  end

  describe "when mccabe_mean is not a number" do
    let(:object) { build(:metric, mccabe_mean: 'a') }
    it_behaves_like "validating that is a number", :mccabe_mean
  end

  describe "when mccabe_mean is a number less than 0" do
    let(:object) { build(:metric, mccabe_mean: -1) }
    it_behaves_like "validating number greater than or equal to a count", :mccabe_mean, 0
  end

  describe "when mccabe_median is not a number" do
    let(:object) { build(:metric, mccabe_median: 'a') }
    it_behaves_like "validating that is a number", :mccabe_median
  end

  describe "when mccabe_median is a number less than 0" do
    let(:object) { build(:metric, mccabe_median: -1) }
    it_behaves_like "validating number greater than or equal to a count", :mccabe_median, 0
  end

  describe "when mccabe_min is not a number" do
    let(:object) { build(:metric, mccabe_min: 'a') }
    it_behaves_like "validating that is a number", :mccabe_min
  end

  describe "when mccabe_min is a number less than 0" do
    let(:object) { build(:metric, mccabe_min: -1) }
    it_behaves_like "validating number greater than or equal to a count", :mccabe_min, 0
  end

  describe "when mccabe_sum is not a number" do
    let(:object) { build(:metric, mccabe_sum: 'a') }
    it_behaves_like "validating that is a number", :mccabe_sum
  end

  describe "when mccabe_sum is a number less than 0" do
    let(:object) { build(:metric, mccabe_sum: -1) }
    it_behaves_like "validating number greater than or equal to a count", :mccabe_sum, 0
  end

  describe "when ncomment is not a number" do
    let(:object) { build(:metric, ncomment: 'a') }
    it_behaves_like "validating that is a number", :ncomment
  end

  describe "when ncomment is a number less than 0" do
    let(:object) { build(:metric, ncomment: -1) }
    it_behaves_like "validating number greater than or equal to a count", :ncomment, 0
  end

  describe "when nfunctions is not a number" do
    let(:object) { build(:metric, nfunctions: 'a') }
    it_behaves_like "validating that is a number", :nfunctions
  end

  describe "when nfunctions is a number less than 0" do
    let(:object) { build(:metric, nfunctions: -1) }
    it_behaves_like "validating number greater than or equal to a count", :nfunctions, 0
  end

  describe "when sloc is not a number" do
    let(:object) { build(:metric, sloc: 'a') }
    it_behaves_like "validating that is a number", :sloc
  end

  describe "when sloc is a number less than 0" do
    let(:object) { build(:metric, sloc: -1) }
    it_behaves_like "validating number greater than or equal to a count", :sloc, 0
  end
end