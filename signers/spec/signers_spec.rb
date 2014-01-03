class Signer 
  def initialize(key_id)
    @key_id = key_id
    freeze
  end

  def to_s
    "#{@key_id}"
  end

end

class Signers 

  def initialize(values)
    @values = values
  end

  def keys_id
    @values.map(&:to_s)
  end

end

describe "User with PGP key" do 
  let(:signers_vals) { %w[1 2 3 4].map { |key_id| Signer.new(key_id) } }
  let(:signers) { Signers.new signers_vals }

  it 'returns all the id for all the signers' do 
    expect(
      signers.keys_id
    ).to eql %w[1 2 3 4]
  end

  it 'returns all the UIDs for the signers' do 
    expect(
      signers.uids
    ).to eql %w

  end

end
