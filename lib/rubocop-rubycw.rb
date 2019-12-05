# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/rubycw'
require_relative 'rubocop/rubycw/version'
require_relative 'rubocop/rubycw/inject'

RuboCop::Rubycw::Inject.defaults!

require_relative 'rubocop/cop/rubycw_cops'
