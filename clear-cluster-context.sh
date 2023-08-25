#! /usr/bin/bash

for context in $(kubectl config get-contexts -o name); do
    kubectl config delete-context $context
done

