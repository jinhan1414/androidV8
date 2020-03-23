# android-arm
build_platform=android-arm
./tools/dev/v8gen.py ${build_platform} -vv
rm out.gn/${build_platform}/args.gn
cd out.gn/${build_platform}/
wget https://raw.githubusercontent.com/jinhan1414/J2V8/master/v8/android-arm/args.gn
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn
cd ../../
# Build the V8 monolithic static liblary
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith

# android-arm64
build_platform=android-arm64
./tools/dev/v8gen.py ${build_platform} -vv
rm out.gn/${build_platform}/args.gn
cd out.gn/${build_platform}/
wget https://raw.githubusercontent.com/jinhan1414/J2V8/master/v8/android-arm64/args.gn
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn
cd ../../
# Build the V8 monolithic static liblary
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith

# android-x86
build_platform=android-x86
./tools/dev/v8gen.py ${build_platform} -vv
rm out.gn/${build_platform}/args.gn
cd out.gn/${build_platform}/
wget https://raw.githubusercontent.com/jinhan1414/J2V8/master/v8/android-ia32/args.gn
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn
cd ../../
# Build the V8 monolithic static liblary
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith

# android-x64
build_platform=android-x64
./tools/dev/v8gen.py ${build_platform} -vv
rm out.gn/${build_platform}/args.gn
cd out.gn/${build_platform}/
wget https://raw.githubusercontent.com/jinhan1414/J2V8/master/v8/android-x64/args.gn
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn
cd ../../
# Build the V8 monolithic static liblary
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith
