# Copyright 2011-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

module Aws
  module Core
    class Client < Seahorse::Client

      # @api private
      MISSING_REGION = 'a region must be specified'

      # @option options [required, String] :region
      def initialize(options = {})
        super(options)
        @region = config.region || raise(ArgumentError, MISSING_REGION)
      end

      # @return [String]
      attr_reader :region

      private

      # @param [Hash] options
      # @return [Configuration]
      def build_config(options)
        Configuration.new(options)
      end

      def default_endpoint
        "#{api['endpoint_prefix']}.#{config.region}.#{domain}"
      end

      def domain
        'amazonaws.com'
      end

      def endpoint_prefix
        api['endpoint_prefix']
      end

    end
  end
end
