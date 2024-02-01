// test/Vulnerable.test.js
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Vulnerable Contract", function () {
  let Vulnerable;
  let vulnerable;
  let owner;
  let addr1;

  beforeEach(async function () {
    [owner, addr1] = await ethers.getSigners();

    const VulnerableFactory = await ethers.getContractFactory("Vulnerable");
    vulnerable = await VulnerableFactory.deploy();
    await vulnerable.deployed();
  });

  it("Should deposit and withdraw Ether", async function () {
    const depositAmount = ethers.utils.parseEther("1");
    await vulnerable.connect(addr1).deposit({ value: depositAmount });

    const balanceBefore = await ethers.provider.getBalance(addr1.address);
    await vulnerable.connect(addr1).withdraw();
    const balanceAfter = await ethers.provider.getBalance(addr1.address);

    expect(balanceAfter.sub(balanceBefore)).to.equal(depositAmount);
  });

  it("Should buy and sell tokens", async function () {
    const buyAmount = ethers.utils.parseEther("1");
    await vulnerable.connect(addr1).buyTokens({ value: buyAmount });

    const tokenBalanceBefore = await vulnerable.balances(addr1.address);
    expect(tokenBalanceBefore).to.equal(buyAmount.mul(vulnerable.tokensPerEth));

    const sellAmount = ethers.utils.parseEther("0.5");
    await vulnerable.connect(addr1).sellTokens(sellAmount);

    const tokenBalanceAfter = await vulnerable.balances(addr1.address);
    expect(tokenBalanceAfter).to.equal(tokenBalanceBefore.sub(sellAmount.mul(vulnerable.tokensPerEth)));
  });

  it("Should set winner correctly", async function () {
    // For simplicity, assume the block timestamp is even (value = 0).
    await vulnerable.winnerCheck(0);

    const winner = await vulnerable.winner();
    expect(winner).to.equal(addr1.address);
  });
});
