// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

struct Item {
  Type types;
  uint256[] rates;
}

struct ResultItem {
  Type types;
  uint256 rate;
}

enum Type {
  K9,
  SEELS
}
