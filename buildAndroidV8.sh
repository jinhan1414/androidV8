./tools/dev/v8gen.py x64.release -vv
# android-arm
build_platform=android-arm
cp -r out.gn/x64.release out.gn/${build_platform}
rm out.gn/${build_platform}/args.gn
cp ../J2V8/v8/android-arm/args.gn  out.gn/${build_platform}/args.gn
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn

# android-arm64
build_platform=android-arm64
cp -r out.gn/x64.release out.gn/${build_platform}
rm out.gn/${build_platform}/args.gn
cp ../J2V8/v8/android-arm64/args.gn  out.gn/${build_platform}/args.gn
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn

# android-x86
build_platform=android-x86
cp -r out.gn/x64.release out.gn/${build_platform}
rm out.gn/${build_platform}/args.gn
cp ../J2V8/v8/android-ia32/args.gn  out.gn/${build_platform}/args.gn
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn

# android-x64
build_platform=android-x64
cp -r out.gn/x64.release out.gn/${build_platform}
rm out.gn/${build_platform}/args.gn
cp ../J2V8/v8/android-x64/args.gn  out.gn/${build_platform}/args.gn
ls -al out.gn/${build_platform}/
cat out.gn/${build_platform}/args.gn
touch out.gn/${build_platform}/args.gn

# Build the V8 monolithic static liblary
build_platform=android-arm
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith

# Build the V8 monolithic static liblary
build_platform=android-arm64
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith


# Build the V8 monolithic static liblary
build_platform=android-x86
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith


# Build the V8 monolithic static liblary
build_platform=android-x64
ninja -C out.gn/${build_platform} -t clean
ninja -C out.gn/${build_platform} v8_monolith

# 生成构建压缩包
echo "构建完成，生成压缩包"
cd ../
rm -rf libv8_monolith
mkdir libv8_monolith
cd libv8_monolith

build_platform=android-arm
mkdir ${build_platform}
cp ../v8/out.gn/${build_platform}/obj/v8_monolith.a ${build_platform}/v8_monolith.a

build_platform=android-arm64
mkdir ${build_platform}
cp ../v8/out.gn/${build_platform}/obj/v8_monolith.a ${build_platform}/v8_monolith.a

build_platform=android-x86
mkdir ${build_platform}
cp ../v8/out.gn/${build_platform}/obj/v8_monolith.a ${build_platform}/v8_monolith.a

build_platform=android-x64
mkdir ${build_platform}
cp ../v8/out.gn/${build_platform}/obj/v8_monolith.a ${build_platform}/v8_monolith.a

cp -r ../v8/include ./include

zip -q -r libv8_monolith.zip *
echo "构建完成压缩包完成"
echo "路径："+`pwd`+"libv8_monolith.zip"
