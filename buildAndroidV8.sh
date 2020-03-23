./tools/dev/v8gen.py x64.release -vv
# android-arm
build_platform=android-arm
cp -r out.gn/x64.release out.gn/${build_platform}
rm out.gn/${build_platform}/args.gn
cd out.gn/${build_platform}/
wget https://raw.githubusercontent.com/jinhan1414/J2V8/master/v8/android-arm/args.gn
cd ../../
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn
# Build the V8 monolithic static liblary
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith

# android-arm64
build_platform=android-arm64
cp -r out.gn/x64.release out.gn/${build_platform}
rm out.gn/${build_platform}/args.gn
cd out.gn/${build_platform}/
wget https://raw.githubusercontent.com/jinhan1414/J2V8/master/v8/android-arm64/args.gn
cd ../../
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn
# Build the V8 monolithic static liblary
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith

# android-x86
build_platform=android-x86
cp -r out.gn/x64.release out.gn/${build_platform}
rm out.gn/${build_platform}/args.gn
cd out.gn/${build_platform}/
wget https://raw.githubusercontent.com/jinhan1414/J2V8/master/v8/android-ia32/args.gn
cd ../../
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn
# Build the V8 monolithic static liblary
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith

# android-x64
build_platform=android-x64
cp -r out.gn/x64.release out.gn/${build_platform}
rm out.gn/${build_platform}/args.gn
cd out.gn/${build_platform}/
wget https://raw.githubusercontent.com/jinhan1414/J2V8/master/v8/android-x64/args.gn
cd ../../
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn
# Build the V8 monolithic static liblary
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith
