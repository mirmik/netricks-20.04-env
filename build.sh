docker build . -t arm32v7/netricks-20.04-env -f docker.arch --build-arg ARCH=arm32v7
docker build . -t arm64v8/netricks-20.04-env -f docker.arch --build-arg ARCH=arm64v8
docker build . -t netricks-20.04-env -f docker.host

mkdir -p dist
mkdir -p dist/arm32v7
mkdir -p dist/arm64v8

docker cp $(docker create arm32v7/netricks-20.04-env):/lib/arm-linux-gnueabihf/libc.so.6 dist/arm32v7/
cd dist/arm32v7
tar -xvf libs.tar
rm libs.tar
cd ../..

#docker cp $(docker create arm64v8/netricks-20.04-env):/lib/arm-linux-gnueabihf/libc.so.6 dist/arm64v8/libs.tar
#cd dist/arm64v8
#tar -xvf libs.tar
#rm libs.tar
#cd ../..

#docker cp $(docker create arm64v8/netricks-20.04-env):/usr/lib/arm-linux-gnueabihf/libstdc++.so.6 dist/arm64v8/libs.tar
#cd dist/arm64v8
#tar -xvf libs.tar
#rm libs.tar
#cd ../..

#docker cp $(docker create arm32v7/netricks-20.04-env):/usr/lib/arm-linux-gnueabihf/libstdc++.so.6 dist/arm32v7/libs.tar
#cd dist/arm32v7
#tar -xvf libs.tar
#rm libs.tar
#cd ../..
