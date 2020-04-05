require 'mkmf'

def crash(str)
  puts " extconf failure: #{str}\n"
  exit 1
end

LIBDIR      = RbConfig::CONFIG['libdir']
INCLUDEDIR  = RbConfig::CONFIG['includedir']
HEADER_DIRS = [
  '/opt/local/include',
  '/usr/local/include',
  INCLUDEDIR,
  '/usr/include'
]
LIB_DIRS = [
  '/opt/local/lib',
  '/usr/local/lib',
  LIBDIR,
  '/usr/lib'
]

dir_config('co2mon', HEADER_DIRS, LIB_DIRS)
unless find_header('hidapi/hidapi.h')
 crash "hidapi/hidapi.h not found"
end
unless find_library('hidapi-libusb', "hid_init", "hid_exit")
 crash "hidapi not found"
end
create_makefile('co2mon')
