// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from 'forge-std/Script.sol';
import {PullRewardsTransferStrategy} from 'aave-v3-periphery/contracts/rewards/transfer-strategies/PullRewardsTransferStrategy.sol';
import {AaveV3Polygon} from 'aave-address-book/AaveV3Polygon.sol';

contract SDDeployTransferStrategy is Script {
  address internal constant REWARDS_CONTROLLER = 0x929EC64c34a17401F460460D4B9390518E5B473e;
  address internal constant EMISSION_ADMIN = 0x51358004cFe135E64453d7F6a0dC433CAba09A2a;
  address internal constant REWARDS_VAULT = EMISSION_ADMIN;

  function run() external {
    vm.startBroadcast();
    new PullRewardsTransferStrategy(
      AaveV3Polygon.DEFAULT_INCENTIVES_CONTROLLER,
      EMISSION_ADMIN,
      REWARDS_VAULT
    );
    vm.stopBroadcast();
  }
}

contract STMATICDeployTransferStrategy is Script {
  address internal constant REWARDS_VAULT = EMISSION_ADMIN;
  address internal constant EMISSION_ADMIN = 0x0c54a0BCCF5079478a144dBae1AFcb4FEdf7b263;

  function run() external {
    vm.startBroadcast();
    new PullRewardsTransferStrategy(
      AaveV3Polygon.DEFAULT_INCENTIVES_CONTROLLER,
      EMISSION_ADMIN,
      REWARDS_VAULT
    );
    vm.stopBroadcast();
  }
}
