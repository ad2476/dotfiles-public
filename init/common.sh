#!/bin/bash

function command_exists() {
  builtin type -P "$1" &> /dev/null
}
