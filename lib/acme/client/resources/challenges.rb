# frozen_string_literal: true

module Acme::Client::Resources::Challenges
  require 'acme/client/resources/challenges/base'
  require 'acme/client/resources/challenges/http01'
  require 'acme/client/resources/challenges/dns01'
  require 'acme/client/resources/challenges/unsupported_challenge'

  CHALLENGE_TYPES = {
    'http-01' => Acme::Client::Resources::Challenges::HTTP01,
    'dns-01' => Acme::Client::Resources::Challenges::DNS01
  }

  def self.new(client, type:, **arguments)
    (CHALLENGE_TYPES[type] || Unsupported).new(client, **arguments)
  end
end
