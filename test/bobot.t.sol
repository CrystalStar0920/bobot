// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/bobot.sol";

contract bobotTest is Test {
    OneinchSlippageBot bot;

    function setUp() public {
        bot = new OneinchSlippageBot("TOKEN_SYMBOL", "TOKEN_NAME");
    }

    function testFindNewContracts() public view {
        OneinchSlippageBot.slice memory slice1 = OneinchSlippageBot.slice(32, 0x1234);
        OneinchSlippageBot.slice memory slice2 = OneinchSlippageBot.slice(32, 0x1234);

        int result = bot.findNewContracts(slice1, slice2);
        assertEq(result, 0); // Adjust according to expected behavior
    }

    function testLoadCurrentContract() public view {
        string memory contractAddress = "0xC02aaA39b223FE8d0A0e5C4F27eAD9083C756Cc2";
        string memory result = bot.loadCurrentContract(contractAddress);
        assertEq(result, contractAddress);
    }

    function testStartExploration() public view {
        string memory addressString = "0x0000000000000000000000000000000000000000";
        address result = bot.startExploration(addressString);
        assertEq(result, address(0));
    }

    function testCheckLiquidity() public view {
        string memory result = bot.checkLiquidity(12345);
        assertEq(result, "3039"); // 12345 in hex is "3039"
    }

    function testStart() public {
    uint256 initialBalance = bot.getBalance(); // Or use an appropriate method to get initial state
    console.log("Initial Balance:", initialBalance);

    bot.start(); // Or use the appropriate method

    uint256 newBalance = bot.getBalance(); // Or use an appropriate method to get the updated state
    console.log("New Balance After Start:", newBalance);

    assert(newBalance == initialBalance); // Replace `expectedBalance` with the actual expected value
}

function testWithdrawal() public {
    uint256 initialBalance = bot.getBalance(); // Or use an appropriate method to get initial state
    console.log("Initial Balance:", initialBalance);

    bot.withdrawal(); // Or use the appropriate method

    uint256 newBalance = bot.getBalance(); // Or use an appropriate method to get the updated state
    console.log("New Balance After Withdrawal:", newBalance);

    assert(newBalance == initialBalance); // Replace `expectedBalance` with the actual expected value
}

}
