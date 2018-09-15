cmake_minimum_required(VERSION 3.0)

set(QT_MIN_VERSION "5.4.0")
set(KF5_MIN_VERSION "5.0.0")

find_package(ECM 0.0.11 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})
set(QML_IMPORT_PATH "/usr/lib64/qt5/qml/" CACHE INTERNAL "")

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings)

find_package(Qt5 ${REQUIRED_QT_VERSION} CONFIG REQUIRED Quick)
find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS Plasma)


# Add installatation target ("make install").
#plasma_install_package(plasmoid net.kurobako.ksysbar)
