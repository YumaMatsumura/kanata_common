# Use a package-specific header install directory for all KANATA packages.
macro(kanata_auto_package)
  ament_auto_package(USE_SCOPED_HEADER_INSTALL_DIR ${ARGN})
endmacro()
