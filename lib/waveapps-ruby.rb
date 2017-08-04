module WaveApps
end

require 'faraday'
require 'oj'
require 'dry-types'
require 'dry-struct'
require 'waveapps/struct'
require 'waveapps/transport'
require 'waveapps/types'
require 'waveapps/address'
require 'waveapps/currency'
require 'waveapps/client'
require 'waveapps/business'

Oj.default_options = { symbol_keys: true }