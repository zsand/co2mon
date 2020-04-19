require "co2mon/version"
require "ffi"

module Co2mon
  extend FFI::Library

  ffi_lib File.expand_path("co2mon.so", __dir__)

  attach_function :get, [], :pointer

  def self.get_data
    data = get.read_array_of_double(2)

    {
      :co2 => data[0],
      :temp => data[1]
    }
  rescue => e
  end
end
