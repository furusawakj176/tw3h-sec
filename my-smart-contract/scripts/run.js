const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory("MyNFTRental");
    const nftContract = await nftContractFactory.deploy();
    const nftRent = await nftContract.deployed();
  
    console.log("Contract deployed to:", nftRent.address);
  };
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  runMain();