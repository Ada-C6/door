require 'simplecov'
SimpleCov.start

require 'time'

require 'minitest'
require 'minitest/spec'
require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/reporters'

require_relative '../lib/doors.rb'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
