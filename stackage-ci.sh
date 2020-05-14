#!/usr/bin/env zsh

# In a new directory
# Build from the tarball on Hackage to check for missing files
stack unpack servant-docs-simple && cd servant-docs-simple-*
# Generate a pristine stack.yaml, adding any missing extra-deps
rm -f stack.yaml && stack init --resolver nightly
# Build, generate docs, test, and build benchmarks
stack build --resolver nightly --haddock --test --bench --no-run-benchmarks
