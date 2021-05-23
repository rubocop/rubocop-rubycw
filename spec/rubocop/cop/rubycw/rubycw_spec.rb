# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rubycw::Rubycw do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense with ruby -cw' do
    expect_offense(<<~RUBY)
      1
      ^ unused literal ignored
      p 1

      p if /re/
      ^ regex literal in condition
    RUBY
  end

  it 'registers an offense for duplicated range of regexp' do
    expect_offense(<<~RUBY)
      /[aaa]/
      ^ character class has duplicated range: /[aaa]/
    RUBY
  end

  it 'does not register an offense to clean code' do
    expect_no_offenses(<<~RUBY)
      p 1
    RUBY
  end

  # https://github.com/rubocop/rubocop-rubycw/issues/12
  it 'does not crash with `Kernel.#warn` and uplevel' do
    warn 'test', uplevel: 0
  end
end
