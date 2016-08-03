$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hubstaff'
require 'dotenv'
require 'vcr'
require 'support/vcr_setup.rb'
Dotenv.load(".env.local")
