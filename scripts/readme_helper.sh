#!/bin/bash

# A script to help populate the README.md table with version and tag numbers

# Function to compare version numbers
compareVersions() {
    printf '%s\n%s\n' "${1}" "${2}" | sort -V | tail -n 1
}

highestIperfVersion=""
output=""

# Collect and determine the highest iperf version by scanning all Dockerfiles
for dir in iperf2 iperf3; do
  for dockerfile in ../${dir}/Dockerfile-*; do
    iperfVersion="$(grep -E 'apk add --no-cache iperf[3]?=' "${dockerfile}" | awk -F'=' '{print $2}' | awk -F ';' '{print $1}')"
    if [[ -n "${iperfVersion}" ]]; then
      # Compare and update the highest version found
      highestIperfVersion="$(compareVersions "${iperfVersion}" "${highestIperfVersion}")"
    fi
  done
done

# Loop through all Dockerfiles with the naming pattern "Dockerfile-VERSION"
for dir in iperf2 iperf3; do
  for dockerfile in ../${dir}/Dockerfile-*; do
    # Extract the version from the filename (removing the "Dockerfile-" prefix)
    fileVersion="${dockerfile#../${dir}/Dockerfile-}"

    # Extract the Alpine version from the FROM line
    alpineVersion="$(grep -E '^FROM alpine:' "${dockerfile}" | awk -F: '{print $2}')"

    # Extract the iperf version from the apk add line
    iperfVersion="$(grep -E 'apk add --no-cache iperf[3]?=' "${dockerfile}" | awk -F'=' '{print $2}' | awk -F ';' '{print $1}')"

    # Determine the Git branch name based on the version
    if [[ "${fileVersion}" == "latest" ]]; then
      gitTag="master"
      iperfVersion="${highestIperfVersion}"
    else
      gitTag="${fileVersion}"
    fi

    # Store the information for later sorting
    output+="$(printf "%-15s | %-10s | %-10s\n" "$iperfVersion" "$gitTag" "$fileVersion")"
    output+=$'\n'

  done
done

printf "%-15s | %-10s | %-10s\n" "iperf Version" "Git Tag" "Docker Tag"
printf "%-15s | %-10s | %-10s\n" "--------------" "----------" "---------"
echo "$output" | sort -Vr

