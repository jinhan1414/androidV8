ARG sys_image=ubuntu

FROM $sys_image

# default values
ARG vendor=debian
ARG target_os=android
ARG target_cpu=x64

ENV DEBIAN_FRONTEND=noninteractive

# Update depedency of V8
RUN apt-get -qq update && \
	DEBIAN_FRONTEND=noninteractive apt-get -qq install -y \
				lsb-release \
				sudo \
				apt-utils \
				git \
				python \
				lbzip2 \
				curl 	\
				wget	\
				xz-utils \
				vim \
				libc6-dev-i386 \
				g++-multilib \
        tzdata

RUN mkdir -p /v8build
WORKDIR /v8build

# DEPOT TOOLS install
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
RUN git clone https://github.com/eclipsesource/J2V8.git
ENV PATH /v8build/depot_tools:"$PATH"
RUN echo $PATH

ENV target_os ${target_os}
ENV target_cpu ${target_cpu}
ENV build_platform ${target_cpu}.release
ENV path_to_args ${target_os}-${target_cpu}/args.gn

RUN echo ${target_os}
RUN echo ${target_cpu}
RUN echo ${build_platform}
RUN echo ${path_to_args}

# Fetch V8 code
RUN fetch v8
WORKDIR /v8build/v8
RUN git checkout 8.0.426
WORKDIR /v8build

RUN echo "target_os= ['${target_os}']">>.gclient
RUN gclient sync

WORKDIR /v8build/v8

RUN echo y | \
	if [ "x${target_os}" = "xandroid" ]; then \
		./build/install-build-deps-android.sh ; \
	else \
		./build/install-build-deps.sh ; fi

RUN git pull origin 8.0.426
RUN gclient sync

RUN wget https://raw.githubusercontent.com/jinhan1414/androidV8/master/buildAndroidV8.sh
