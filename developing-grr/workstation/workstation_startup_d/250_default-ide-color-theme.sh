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
cd /home/user/.codeoss-cloudworkstations/data/Machine/
if [ -f settings.json ]; then
  cat <<< $(jq '. += {"window.autoDetectColorScheme": true}' settings.json) > settings.json
  cat <<< $(jq '. += {"workbench.colorTheme": "Default Dark Modern"}' settings.json) > settings.json
else
  cp /demo/settings.json .
  chown user:user settings.json
fi
cd -
