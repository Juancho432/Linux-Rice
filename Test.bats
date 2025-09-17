#!/usr/bin/env bats
@test "Execution without arguments" {
    run ./install.sh
    [ "$status" -eq 64 ]
}
