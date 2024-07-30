// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

struct Item {
  Type types;
  uint64 rate;
}

enum Type {
  K9,
  SEELS
}
