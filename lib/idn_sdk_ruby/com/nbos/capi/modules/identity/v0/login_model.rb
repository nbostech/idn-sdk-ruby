module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class LoginModel
                attr_accessor :username, :password

                def initialize(name = nil, code = nil)
                  @username = name
                  @password = code
                end

                def as_json(options={})
                  {
                      username: @username,
                      password: @password
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