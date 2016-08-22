module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Media
            module V0

            class MediaFileDetails
              attr_accessor :mediapath, :mediatype

              def initialize(media_details)
                @mediapath = media_details["mediapath"]
                @mediatype = media_details["mediatype"]
              end

              def as_json(options={})
                {
                    mediapath: @mediapath,
                    mediatype: @mediatype
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