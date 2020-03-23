        mkdir dock
        cd dock
        wget https://raw.githubusercontent.com/jinhan1414/androidV8/master/Dockerfile
        sudo docker login --username=${aliyun_username} registry.cn-chengdu.aliyuncs.com --password=${aliyun_password}
        docker images
        sudo docker build -t ${{ matrix.image-name }}:${{ matrix.image-version }} .
        sudo docker tag ${{ matrix.image-name }}:${{ matrix.image-version }} registry.cn-chengdu.aliyuncs.com/jinchengsong001/chengdu:${{ matrix.image-version }}
        sudo docker push registry.cn-chengdu.aliyuncs.com/jinchengsong001/chengdu:${{ matrix.image-version }}   
