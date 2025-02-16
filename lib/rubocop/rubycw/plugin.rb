# frozen_string_literal: true

require 'lint_roller'

module RuboCop
  module Rubycw
    # A plugin that integrates RuboCop Rubycw with RuboCop's plugin system.
    class Plugin < LintRoller::Plugin
      def about
        LintRoller::About.new(
          name: 'rubocop-rubycw',
          version: VERSION,
          homepage: 'https://github.com/rubocop/rubocop-rubycw',
          description: 'Integrate RuboCop and `ruby -cw`.'
        )
      end

      def supported?(context)
        context.engine == :rubocop
      end

      def rules(_context)
        LintRoller::Rules.new(
          type: :path,
          config_format: :rubocop,
          value: Pathname.new(__dir__).join('../../../config/default.yml')
        )
      end
    end
  end
end
