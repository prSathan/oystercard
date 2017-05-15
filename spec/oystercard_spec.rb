require 'oystercard'

describe Oystercard do

  it "should return a balance of zero when first initialized" do
    expect(subject.balance).to eq 0
  end

  it "should add 100 to the balance when we top up 100" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "should raise error if balance exceeds 90" do
    if subject.balance > described_class::LIMIT
    expect { subject.top_up(1) }.to raise_error ("Balance has exceeded limit of #{described_class::LIMIT}")
    end
  end
end
