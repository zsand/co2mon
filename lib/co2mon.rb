require "co2mon/version"
require "ffi"

module Co2mon
  extend FFI::Library

  ffi_lib File.expand_path("co2mon.bundle", __dir__)

  attach_function :get, [], :pointer

  def self.get_data
    data = get.get_array_of_int32(0, 2)

    {
      :co2 => data[0],
      :temp => data[1]
    }
  rescue => e
  end
end
