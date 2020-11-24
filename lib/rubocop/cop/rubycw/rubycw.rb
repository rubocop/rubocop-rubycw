# frozen_string_literal: true

module RuboCop
  module Cop
    module Rubycw
      # Execute `ruby -cw` and wrap the warning as RuboCop offense.
      class Rubycw < Base
        include RangeHelp

        def on_new_investigation
          source = processed_source.raw_source

          warnings(source).each do |line|
            lnum = line[/.+:(\d+):/, 1].to_i
            message = line[/.+:\d+: warning: (.+)$/, 1]

            range = source_range(processed_source.buffer, lnum, 0)
            add_offense(range, message: message)
          end
        end

        def warnings(source)
          RuboCop::Rubycw::WarningCapturer.capture(source)
        end
      end
    end
  end
end
