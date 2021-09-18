include(DefinePlatformDefaults)

include(elyranur_add_test.cmake)

set(CMAKE_AUTOMOC TRUE)

add_library(testutils
  STATIC
  syncenginetestutils.cpp
  pushnotificationstestutils.cpp
  themeutils.cpp
  testhelper.cpp
)

target_link_libraries(testutils PUBLIC elyranursync Qt5::Test)
target_include_directories(testutils PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
set_target_properties(testutils PROPERTIES FOLDER Tests)

elyranur_add_test(ElyranurPropagator)

IF(BUILD_UPDATER)
    elyranur_add_test(Updater)
endif()

elyranur_add_test(NetrcParser)
elyranur_add_test(OwnSql)
elyranur_add_test(SyncJournalDB)
elyranur_add_test(SyncFileItem)
elyranur_add_test(ConcatUrl)
elyranur_add_test(Cookies)
elyranur_add_test(XmlParse)
elyranur_add_test(ChecksumValidator)

elyranur_add_test(ClientSideEncryption)
elyranur_add_test(ExcludedFiles)

elyranur_add_test(Utility)
elyranur_add_test(SyncEngine)
elyranur_add_test(SyncVirtualFiles)
elyranur_add_test(SyncMove)
elyranur_add_test(SyncDelete)
elyranur_add_test(SyncConflict)
elyranur_add_test(SyncFileStatusTracker)
elyranur_add_test(Download)
elyranur_add_test(ChunkingNg)
elyranur_add_test(AsyncOp)
elyranur_add_test(UploadReset)
elyranur_add_test(AllFilesDeleted)
elyranur_add_test(Blacklist)
elyranur_add_test(LocalDiscovery)
elyranur_add_test(RemoteDiscovery)
elyranur_add_test(Permissions)
elyranur_add_test(SelectiveSync)
elyranur_add_test(DatabaseError)
elyranur_add_test(LockedFiles)
elyranur_add_test(FolderWatcher)
elyranur_add_test(Capabilities)
elyranur_add_test(PushNotifications)
elyranur_add_test(Theme)
elyranur_add_test(IconUtils)
elyranur_add_test(NotificationCache)
elyranur_add_test(SetUserStatusDialog)

if( UNIX AND NOT APPLE )
    elyranur_add_test(InotifyWatcher)
endif(UNIX AND NOT APPLE)

if (WIN32)
    include_directories(
        ${CMAKE_BINARY_DIR}/src/libsync/vfs/cfapi
    )

    elyranur_add_test(SyncCfApi)
elseif(LINUX) # elseif(LINUX OR APPLE)
    elyranur_add_test(SyncXAttr)
endif()

elyranur_add_test(LongPath)
elyranur_add_benchmark(LargeSync)

elyranur_add_test(Account)
elyranur_add_test(FolderMan)
elyranur_add_test(RemoteWipe)

elyranur_add_test(OAuth)

configure_file(test_journal.db "${PROJECT_BINARY_DIR}/bin/test_journal.db" COPYONLY)

find_package(CMocka)
if (CMOCKA_FOUND)
    include(AddCMockaTest)
    add_subdirectory(csync)
endif (CMOCKA_FOUND)
