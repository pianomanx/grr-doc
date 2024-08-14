# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#!/bin/bash

# https://cloud.google.com/workstations/docs/mount-filestore-nfs-instances

if [ -z ${FILESTORE_INSTANCE_IP} ]; then
  echo "The FILESTORE_INSTANCE_IP environment variable is empty"
  exit
fi

if [ -z ${FILESTORE_SHARE_NAME} ]; then
  echo "The FILESTORE_SHARE_NAME environment variable is empty"
  exit
fi

sudo rpcbind
sudo mkdir -p /home/user/shared_cache
sudo mount -o rw,intr ${FILESTORE_INSTANCE_IP}:/${FILESTORE_SHARE_NAME} /home/user/shared_cache
sudo chmod go+rw /home/user/shared_cache
