require 'spec_helper'

describe Vendor do
  before do
    @vendor = Vendor.new(contact_email: "vendor@example.com", name: "Example Vendor")
  end

  subject { @vendor }

  it { should respond_to(:contact_email) }
  it { should respond_to(:description) }
  it { should respond_to(:logo) }
  it { should respond_to(:name) }
  it { should respond_to(:website) }
  it { should respond_to(:categories) }
  it { should be_valid }

  describe "when name is not present" do
    before { @vendor.name = " " }
    it { should_not be_valid }
  end
end
