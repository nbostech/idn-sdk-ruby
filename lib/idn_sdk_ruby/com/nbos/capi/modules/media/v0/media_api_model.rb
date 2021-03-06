module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Media
            module V0
              class MediaApiModel < IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::BasicActiveModel
                attr_accessor :extension, :supportedsizes, :mediaFileDetailsList, :message

                def initialize(parsed_response)
                  @extension = parsed_response["extension"]
                  @supportedsizes = parsed_response["supportedsizes"]
                  add_mediaFileDetailsList(parsed_response["mediaFileDetailsList"])
                end

                def add_mediaFileDetailsList(media_details_list)
                  @mediaFileDetailsList = []
                  media_details_list.each do |md|
                    @mediaFileDetailsList << IdnSdkRuby::Com::Nbos::Capi::Modules::Media::V0::MediaFileDetails.new(md)
                  end
                end

                def add_errors(json_response)
                  json_response["errors"].each do |e|
                    property_name = e['propertyName']
                    msg = e['message']
                    self.errors[property_name] << msg
                  end
                end

                def add_messages(json_response)
                  if json_response["message"].present?
                    @message = json_response["message"]
                  elsif json_response["error"].present?
                    @message = json_response["error"]
                  end

                end

                def as_json(options={})
                  {
                      extension: @extension,
                      supportedsizes: @supportedsizes,
                      mediaFileDetailsList: @mediaFileDetailsList
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