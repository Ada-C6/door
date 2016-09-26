# Spec Helper

require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'

require './lib/door.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
