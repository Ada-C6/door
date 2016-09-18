require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/spec'
require "minitest/autorun"
require "minitest/reporters"
require 'minitest/pride'
require_relative '../door.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
