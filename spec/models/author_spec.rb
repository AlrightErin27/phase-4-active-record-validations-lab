require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'can be created with valid data' do
    author = Author.new(name: 'Caligula', phone_number: '54115441')
    expect(author).to be_valid
  end

  describe 'Basic validations' do
    it { is_expected.to validate_length_of(:phone_number).is_equal_to(8) }
  end
end
