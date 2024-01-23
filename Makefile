-include .env

.PHONY: deployToAnvil deployToSepolia generateTestReport
# .phoney describes all the command are not directories

# Including @ will not display the acutal command in terminal
# The backslash (\) is used as a line continuation 

deployToAnvil:
	@forge script script/DeployDSCEngine.s.sol:DeployDSCEngine --rpc-url $(ANVIL_RPC_URL) --account $(ACCOUNT_FOR_ANVIL) --sender $(ANVIL_KEYCHAIN) --broadcast

deployToSepolia:
	@forge script script/DeployDSCEngine.s.sol:DeployDSCEngine --rpc-url $(SEPOLIA_RPC_URL) --account $(ACCOUNT_FOR_SEPOLIA) --sender $(SEPOLIA_KEYCHAIN) --broadcast --verify $(ETHERSCAN_API_KEY)

generateTestReport :;
	@rm -rf coverage; \
	forge coverage --report lcov; \
	genhtml lcov.info --output-directory coverage; \
	open coverage/index.html; \