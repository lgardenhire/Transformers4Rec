#
# Copyright (c) 2022, NVIDIA CORPORATION.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#!/bin/bash
set -e

# Get latest Transformers4Rec version
cd /transformers4rec/
git pull origin main

container=$1

## Tensorflow container
if [ "$container" == "merlin-tensorflow" ]; then
    pytest -rsx tests/tf
# Pytorch container
elif [ "$container" == "merlin-pytorch" ]; then
    pytest -rsx tests/torch
fi
