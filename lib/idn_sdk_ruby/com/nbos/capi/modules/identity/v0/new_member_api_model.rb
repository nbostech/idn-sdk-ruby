module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class NewMemberApiModel
                attr_accessor :member, :token
                def initialize(parsed_response = nil)
                  if parsed_response !=nil
                  end
                end

                def as_json(options={})
                  {
                      member: @member,
                      roken: @token
                  }
                end

                def to_json(*options)
                  as_json(*options).to_json(*options)
                end

                def to_s
                  to_json
                end
              end
            end
          end
        end
      end
    end
  end
end