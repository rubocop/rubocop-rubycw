# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rubycw::Rubycw do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense with ruby -cw' do
    expect_offense(<<~RUBY)
      1
      ^ unused literal ignored
      p 1
    RUBY
  end

  it 'does not register an offense to clean code' do
    expect_no_offenses(<<~RUBY)
      p 1
    RUBY
  end
end
