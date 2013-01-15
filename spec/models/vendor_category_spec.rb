require 'spec_helper'

describe VendorCategory do
  before do
    @category = VendorCategory.new(name: "Example Category")
  end

  subject { @category }

  it { should respond_to(:name) }
end
