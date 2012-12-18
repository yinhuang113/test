require 'spec_helper'

describe ZoneType do
  before do
    @zone_type = ZoneType.new(name: "Example Zone")
  end

  subject { @zone_type }

  it { should respond_to(:name) }
end
