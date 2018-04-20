#! /bin/sh
# Note: change *.xcconfig file and then rebuild project will not see changes for derivedData Caches.
# 说明：直接修改*.xcconfig文件，重新编译，app里面并不能马上体现是因为derivedData的缓存导致的
# remove derivedData and clean project for rebuild
# 该脚本用于清除缓存，保证每次的修改编译后都能够及时生效
# Xcode Version: 9.3 (9E145) <not test for other xcode version>
# 版本：Xcode Version 9.3 (9E145)  <其他版本Xcode没测试过>
# run script at `Target -> Build Phases -> Run Script`
# 该脚本集成在`Target -> Build Phases -> Run Script`中运行
# If not run the script on Xcode, you can run Xcode Menu Product -> Clean  
# 如果不集成该该脚本，可以手动Xcode的菜单Product -> Clean 清除缓存


if [ -z "${CONFIGURATION}" ]; then
    echo "error configuration, exit!"
    exit 0
fi

echo "build project ${PROJECT_NAME} and configuration is ${CONFIGURATION}"

BASE_DIR="/Users/$(whoami)/Library/Developer/Xcode/DerivedData"
RESULT=$(ls ${BASE_DIR} | grep ${PROJECT_NAME})

echo "==== start clean derivedData ===="
for directory in ${RESULT}
    do
        rm -rf "${BASE_DIR}/$directory/Build/Products/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.app"
        rm -rf "${BASE_DIR}/$directory/Build/Products/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.build"
        rm -rf "${BASE_DIR}/$directory/Build/Products/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.app.dSYM"
    done

xcodebuild -alltargets clean -configuration ${CONFIGURATION}
