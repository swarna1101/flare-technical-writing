interface IFtsoRegistry {

    /**
     * @dev Returns the list of supported asset symbols by the registry.
     *
     * Examples:
     * - "BTC" for Bitcoin
     * - "ETH" for Ethereum
     * - "FLR" for Flare
     *
     * These symbols represent the assets for which the registry can provide
     * current price information.
     *
     * @return _supportedSymbols An array of string symbols representing supported assets.
     */
    function getSupportedSymbols() external view returns (
        string[] memory _supportedSymbols
    );

    /**
     * @dev Returns the current price of the requested asset symbol in USD.
     *
     * The price value needs to be divided by 10 raised to the power of `_assetPriceUsdDecimals`
     * to get the actual asset price in USD. For instance, if the returned `_price` is 1234
     * and `_assetPriceUsdDecimals` is 5, the actual price would be 0.01234 USD.
     *
     * This method will revert if the provided `_symbol` is not supported by the registry.
     *
     * @param _symbol The asset symbol for which the price needs to be fetched. It must be one
     *                of the symbols returned by the `getSupportedSymbols` function.
     *
     * @return _price The raw price value for the asset. Needs division to convert to actual price.
     * @return _timestamp The UNIX timestamp at which the price was last updated.
     * @return _assetPriceUsdDecimals The number of decimals to divide the `_price` by to get the
     *                                actual asset price in USD.
     */
    function getCurrentPriceWithDecimals(string memory _symbol) external view returns (
        uint256 _price,
        uint256 _timestamp,
        uint256 _assetPriceUsdDecimals
    );

}
