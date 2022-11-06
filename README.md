# なりすましを防ぎつつ匿名投票を実現する

## 使用したtech stacks
Solidity

## 使用したBlockchain
Ethereum（Goerli）

## deployしたContract
MyNFT-Rental.sol  
MyReturn-Token.sol

## application codeやその他のfile
フロント側は箱だけです。

## テスト手順
アカウントA：実施者  
アカウントB：投票者


コントラクト１：MyNFT-Rental (0xdc6Febc82718518156a6365ecCDfb6abDf9B65cC)  
https://thirdweb.com/goerli/0xdc6Febc82718518156a6365ecCDfb6abDf9B65cC/

コントラクト２：NFTReturn　（0x5b71a33A58D8D4D566b9cf241a3da8910676d378）  
https://thirdweb.com/goerli/0x5b71a33A58D8D4D566b9cf241a3da8910676d378/

***
手順１：アカウントAはコントラクト１のmint関数を使い、任意のIDとtokenURIでNFTをミントします  
手順２：アカウントAはコントラクト１のsetApprovalForAll関数を使い、コントラクト２のapprovedをtrueにします（既に実施済み）  
手順３：アカウントAはコントラクト１のrentOut関数を使い、手順１で作ったIDをアカウントBに対して任意の期間貸し出します  
手順４：アカウントAはコントラクト１のuserOf関数を使い、手順１で作ったIDの使用者がアカウントBになっていることを確認します  
手順５：アカウントBはコントラクト２のproxy関数を使い、destに"0xdc6Febc82718518156a6365ecCDfb6abDf9B65cC"、idに手順１で作ったIDをセットし実行します  
手順６：アカウントAはコントラクト１のuserOf関数を使い、手順１で作ったIDの使用者がゼロアドレスになっていることを確認します  

## 審査やテストのためにプロジェクトにアクセスする方法など
