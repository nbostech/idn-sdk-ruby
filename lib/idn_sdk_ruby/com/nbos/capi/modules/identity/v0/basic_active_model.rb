require 'active_model'
module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class BasicActiveModel
                include ActiveModel::Validations
                include ActiveModel::Conversion
                extend ActiveModel::Naming
              end
            end
          end
        end
      end
    end
  end
end