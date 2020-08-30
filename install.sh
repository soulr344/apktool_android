#!/sbin/sh
# Copyright 2020 © soulr344
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Special thanks goes to Syper54 and Voytec83 for finding this idea

if [[ "$(su -c whoami)" != "root" ]]; then
   echo "I can't run without superuser permissions! Aborting!";
   exit;
fi;

set_perm_recursive(){
   dir=$1; perm=$2;
   for i in "$(su -c find "$1")"; do
      su -c chmod $perm $i;
   done;
}

temp=/data/local/apktool/temp;
if [[ ! "$(uname -m | grep '64')" ]]; then aarch="arm"; else aarch="arm64"; fi;
data="https://github.com/soulr344/apktool_android/raw/8.7.7/$aarch/garbage.dat";
apk="https://github.com/soulr344/apktool_android/raw/8.7.7/$aarch/app.apk";

su -c mkdir -p $temp;
echo "Fetching apk...";
#wget "$apk";
echo "Fetching data...";
#wget "$data";

echo "Installing app...";
su -c mv app.apk $temp/app.apk
su -c pm install $temp/app.apk;

echo "Extracting data...";
su -c unzip garbage.dat -d /data/data/per.pqy.apktool;
set_perm_recursive "/data/data/per.pqy.apktool" 0777;

echo "Finishing up..." 
su -c rm -rf garbage.dat $temp;
