# frozen_string_literal: true

module RuboCop
  module Rubycw
    module WarningCapturer
      if defined?(RubyVM::AbstractSyntaxTree)
        module ::Warning
          def self.warn(*message)
            if WarningCapturer.warnings
              WarningCapturer.warnings.concat message
            else
              super
            end
          end
        end

        def self.capture(source)
          start
          RubyVM::AbstractSyntaxTree.parse(source)
          warnings
        ensure
          stop
        end

        def self.start
          @verbose = $VERBOSE
          $VERBOSE = true
          @warnings = []
        end

        def self.stop
          $VERBOSE = @verbose if defined?(@verbose)
          @warnings = nil
        end

        def self.warnings
          @warnings
        end

        stop
      else
        require 'rbconfig'
        require 'open3'

        def self.capture(source)
          _stdout, stderr, _status = Open3.capture3(RbConfig.ruby, '-cw', '-e', source)
          stderr.lines.map(&:chomp)
        end
      end
    end
  end
end
