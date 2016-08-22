module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class EmailConnectApiModel
                attr_accessor :id, :email, :primaryEmail, :verified

                def initialize(parsed_response = nil)
                  if !parsed_response.nil?
                    @id =  parsed_response["id"]
                    @email = parsed_response["email"]
                    @verified = parsed_response["verified"]
                    @primaryEmail = parsed_response["primaryEmail"]
                  end
                end

                def as_json(options={})
                  {
                      id: @id,
                      email: @email,
                      verified: @verified,
                      primaryEmail: @primaryEmail
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