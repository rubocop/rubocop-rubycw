# frozen_string_literal: true

require 'open3'
require 'rbconfig'

module RuboCop
  module Cop
    module Rubycw
      # Execute `ruby -cw` and wrap the warning as RuboCop offense.
      class Rubycw < Cop
        include RangeHelp

        def investigate(processed_source)
          source = processed_source.raw_source
          _stdout, stderr, _status = Open3.capture3(ruby, '-cw', '-e', source)

          stderr.each_line do |line|
            line.chomp!
            lnum = line[/-e:(\d+):/, 1].to_i
            message = line[/-e:\d+: warning: (.+)$/, 1]

            range = source_range(processed_source.buffer, lnum, 0)
            add_offense(range, location: range, message: message)
          end
        end

        def ruby
          RbConfig.ruby
        end
      end
    end
  end
end
