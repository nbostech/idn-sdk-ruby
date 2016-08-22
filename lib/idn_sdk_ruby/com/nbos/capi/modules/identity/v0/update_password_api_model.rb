module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class UpdatePasswordApiModel
                attr_accessor :password, :newPassword
                def initialize(password = nil, new_password = nil)
                  @password = password
                  @newPassword = new_password
                end

                def as_json(options={})
                  {
                      password: @password,
                      newPassword: @newPassword
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