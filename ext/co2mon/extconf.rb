require 'mkmf'

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
find_header('hidapi/hidapi.h')
find_library('hidapi', "hid_init", "hid_exit")
create_makefile('co2mon')
