# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_calculate_config_sha1)
include(hunter_calculate_self)
include(hunter_calculate_toolchain_sha1)
include(hunter_check_flush_needed)
include(hunter_internal_error)
include(hunter_set_config_location)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_apply_gate_settings)
  get_property(gate_done GLOBAL PROPERTY HUNTER_GATE_DONE SET)

  set(cache_init NO)
  if(
     HUNTER_CACHED_ROOT OR
     HUNTER_SHA1 OR
     HUNTER_CONFIG_SHA1 OR
     HUNTER_VERSION OR
     HUNTER_TOOLCHAIN_SHA1
  )
    set(cache_init YES)
  endif()

  hunter_status_debug("Settings:")
  hunter_status_debug("  HunterGate done (${gate_done})")
  hunter_status_debug("  Cache init (${cache_init})")

  if(gate_done)
    if(cache_init)
      hunter_status_debug("Reuse cached values")
      return()
    endif()
    hunter_internal_error("Gate finished but no cache")
  endif()

  hunter_calculate_self(
      "${HUNTER_GATE_ROOT}"
      "${HUNTER_GATE_VERSION}"
      "${HUNTER_GATE_SHA1}"
      hunter_self
  )
  hunter_set_config_location("${hunter_self}" config_location)

  if(HUNTER_BASE)
    set(hunter_base "${HUNTER_BASE}")
  else()
    set(hunter_base "${HUNTER_GATE_ROOT}/_Base")
  endif()

  # HUNTER_GATE_CONFIG_SHA1
  hunter_calculate_config_sha1(
      "${hunter_self}" "${hunter_base}" "${config_location}"
  )

  # HUNTER_GATE_TOOLCHAIN_SHA1
  hunter_calculate_toolchain_sha1("${hunter_self}" "${hunter_base}")

  hunter_test_string_not_empty("${HUNTER_GATE_ROOT}")
  hunter_test_string_not_empty("${HUNTER_GATE_SHA1}")
  hunter_test_string_not_empty("${HUNTER_GATE_CONFIG_SHA1}")
  hunter_test_string_not_empty("${HUNTER_GATE_VERSION}")
  hunter_test_string_not_empty("${HUNTER_GATE_TOOLCHAIN_SHA1}")

  if(cache_init)
    hunter_check_flush_needed("${hunter_self}" flush_done)
    if(flush_done)
      hunter_status_debug("Cache flushed")
    else()
      hunter_status_debug("Cache data is up-to-date")
      return()
    endif()
  endif()

  set(HUNTER_CACHED_ROOT "${HUNTER_GATE_ROOT}" CACHE INTERNAL "")
  set(HUNTER_SHA1 "${HUNTER_GATE_SHA1}" CACHE INTERNAL "")
  set(HUNTER_CONFIG_SHA1 "${HUNTER_GATE_CONFIG_SHA1}" CACHE INTERNAL "")
  set(HUNTER_VERSION "${HUNTER_GATE_VERSION}" CACHE INTERNAL "")
  set(HUNTER_TOOLCHAIN_SHA1 "${HUNTER_GATE_TOOLCHAIN_SHA1}" CACHE INTERNAL "")
endfunction()