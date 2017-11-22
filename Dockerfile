# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM golang:1.9

WORKDIR /go/src/github.com/googlegenomics/htsget
COPY . .

RUN go-wrapper download ./...
RUN go-wrapper install ./...

# The server port can be changed using the --port flag.
EXPOSE 7152

# By default, the server listens for plain HTTP requests on the default port
# (exposed above) and serves requests to public data only.  See the README for
# information about setting up secure access and other supported features.
ENTRYPOINT ["htsget-server"]
