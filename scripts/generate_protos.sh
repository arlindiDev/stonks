#!/bin/bash

# Script to generate Dart code from Protocol Buffer definitions
# Each feature owns its proto definitions and generated code

set -e

echo "Generating Dart code from Proto files..."

# Find protoc compiler
if ! command -v protoc &> /dev/null; then
    echo "Error: protoc compiler not found. Please install it:"
    echo "  macOS: brew install protobuf"
    echo "  Linux: apt-get install protobuf-compiler"
    exit 1
fi

# Check if Dart protoc plugin is activated
if ! command -v protoc-gen-dart &> /dev/null; then
    echo "Activating Dart protoc plugin..."
    dart pub global activate protoc_plugin 24.0.0
    export PATH="$PATH:$HOME/.pub-cache/bin"
fi

# Generate for portfolio feature
echo "Generating portfolio protos..."
mkdir -p lib/features/portfolio/data/generated
protoc \
  --dart_out=grpc:lib/features/portfolio/data/generated \
  --proto_path=lib/features/portfolio/data/proto \
  lib/features/portfolio/data/proto/*.proto

echo "✅ Portfolio proto generation complete!"

# Generate for other features as needed
# Example for stats feature (when you add it):
# echo "Generating stats protos..."
# mkdir -p lib/features/stats/data/generated
# protoc \
#   --dart_out=grpc:lib/features/stats/data/generated \
#   --proto_path=lib/features/stats/data/proto \
#   lib/features/stats/data/proto/*.proto

echo ""
echo "✅ All proto generation complete!"
echo "Generated files:"
echo "  - lib/features/portfolio/data/generated/"
