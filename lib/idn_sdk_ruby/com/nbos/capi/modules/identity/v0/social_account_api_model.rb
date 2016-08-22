module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0

              class SocialAccountApiModel
                attr_accessor :id, :email, :socialType, :imageUrl, :accessToken

                def initialize(social_params = nil)
                  if social_params != nil
                    @id = social_params["id"]
                    @email = social_params["email"]
                    @socialType = social_params["socialType"]
                    @imageUrl = social_params["imageUrl"]
                    @accessToken = social_params["accessToken"]
                  end
                end
              end

              def as_json(options={})
                {
                  id: @id,
                  email: @email,
                  socialType: @socialType,
                  imageUrl: @imageUrl,
                  accessToken: @accessToken
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