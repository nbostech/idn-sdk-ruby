module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Media
            module V0
              class MediaIdsRegistry

                def initialize
                  IdnSdkRuby::Com::Nbos::Capi::Modules::Ids::V0::Ids.register("media", IdnSdkRuby::Com::Nbos::Capi::Modules::Media::V0::MediaApi)
                end
              end
            end
          end
        end
      end
    end
  end
end