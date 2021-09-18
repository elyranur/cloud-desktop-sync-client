if (LINUX)
    set(vfs_xattr_SRCS
        vfs_xattr.cpp
        xattrwrapper_linux.cpp
    )

    add_library(elyranursync_vfs_xattr SHARED
        ${vfs_xattr_SRCS}
    )
    set_target_properties(elyranursync_vfs_xattr
        PROPERTIES
        LIBRARY_OUTPUT_NAME ${APPLICATION_EXECUTABLE}sync_vfs_xattr
    )

    target_link_libraries(elyranursync_vfs_xattr PRIVATE elyranursync)

    set_target_properties(elyranursync_vfs_xattr PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY ${BIN_OUTPUT_DIRECTORY}
        RUNTIME_OUTPUT_DIRECTORY ${BIN_OUTPUT_DIRECTORY}
        PREFIX ""
        AUTOMOC TRUE
    )

    target_include_directories(elyranursync_vfs_xattr BEFORE PUBLIC ${CMAKE_CURRENT_BINARY_DIR} INTERFACE ${CMAKE_CURRENT_BINARY_DIR})

    if(APPLE)
        # for being loadable when client run from build dir
        set(vfs_buildoutputdir "${BIN_OUTPUT_DIRECTORY}/${OWNCLOUD_OSX_BUNDLE}/Contents/PlugIns/")
        set_target_properties(elyranursync_vfs_xattr
            PROPERTIES
            LIBRARY_OUTPUT_DIRECTORY ${vfs_buildoutputdir}
            RUNTIME_OUTPUT_DIRECTORY ${vfs_buildoutputdir}
        )
        # For being loadable when client run from install dir (after make macdeployqt)
        set(vfs_installdir "${LIB_INSTALL_DIR}/../PlugIns")
    else()
        set(vfs_installdir "${PLUGINDIR}")
    endif()

    generate_export_header(elyranursync_vfs_xattr
        BASE_NAME elyranursync_vfs_xattr
        EXPORT_MACRO_NAME NEXTCLOUD_XATTR_EXPORT
        EXPORT_FILE_NAME xattrexport.h
    )

    install(TARGETS elyranursync_vfs_xattr
      LIBRARY DESTINATION "${vfs_installdir}"
      RUNTIME DESTINATION "${vfs_installdir}"
    )
endif()
