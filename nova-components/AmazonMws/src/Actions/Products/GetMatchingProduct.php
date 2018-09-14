<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/12
 * Time: 6:23 PM
 */

namespace Chang\AmazonMws\Actions\Products;

use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;

class GetMatchingProduct extends Action
{
    use ActionTrait;

    protected $data;

    public function getMockData()
    {
        $response = <<<EOD
<?xml version="1.0"?>
<GetMatchingProductResponse xmlns="http://mws.amazonservices.com/schema/Products/2011-10-01">
<GetMatchingProductResult ASIN="B075YC3L3Q" status="Success">
  <Product xmlns="http://mws.amazonservices.com/schema/Products/2011-10-01" xmlns:ns2="http://mws.amazonservices.com/schema/Products/2011-10-01/default.xsd">
    <Identifiers>
      <MarketplaceASIN>
        <MarketplaceId>ATVPDKIKX0DER</MarketplaceId>
        <ASIN>B075YC3L3Q</ASIN>
      </MarketplaceASIN>
    </Identifiers>
    <AttributeSets>
      <ns2:ItemAttributes xml:lang="en-US">
        <ns2:Binding>Health and Beauty</ns2:Binding>
        <ns2:Brand>PEGASI</ns2:Brand>
        <ns2:IsAdultProduct>false</ns2:IsAdultProduct>
        <ns2:Label>PEGASI</ns2:Label>
        <ns2:ListPrice>
          <ns2:Amount>199.00</ns2:Amount>
          <ns2:CurrencyCode>USD</ns2:CurrencyCode>
        </ns2:ListPrice>
        <ns2:Manufacturer>PEGASI</ns2:Manufacturer>
        <ns2:PackageDimensions>
          <ns2:Height Units="inches">2.4015748007</ns2:Height>
          <ns2:Length Units="inches">9.2913385732</ns2:Length>
          <ns2:Width Units="inches">9.2125984158</ns2:Width>
          <ns2:Weight Units="pounds">1.81219979364</ns2:Weight>
        </ns2:PackageDimensions>
        <ns2:PackageQuantity>1</ns2:PackageQuantity>
        <ns2:PartNumber>PEGASI</ns2:PartNumber>
        <ns2:ProductGroup>Health and Beauty</ns2:ProductGroup>
        <ns2:ProductTypeName>HEALTH_PERSONAL_CARE</ns2:ProductTypeName>
        <ns2:Publisher>PEGASI</ns2:Publisher>
        <ns2:SmallImage>
          <ns2:URL>http://ecx.images-amazon.com/images/I/31FKfvyByZL._SL75_.jpg</ns2:URL>
          <ns2:Height Units="pixels">56</ns2:Height>
          <ns2:Width Units="pixels">75</ns2:Width>
        </ns2:SmallImage>
        <ns2:Studio>PEGASI</ns2:Studio>
        <ns2:Title>Light Therapy Glasses, PEGASI Sleep Therapy Glasses, Refresh and Regulate Your Sleep, Solve Your Insomnia,Only Need to Use 25min/Day(Classic Version)</ns2:Title>
      </ns2:ItemAttributes>
    </AttributeSets>
    <Relationships/>
    <SalesRankings>
      <SalesRank>
        <ProductCategoryId>health_and_beauty_display_on_website</ProductCategoryId>
        <Rank>328132</Rank>
      </SalesRank>
      <SalesRank>
        <ProductCategoryId>13053141</ProductCategoryId>
        <Rank>189</Rank>
      </SalesRank>
      <SalesRank>
        <ProductCategoryId>10079996011</ProductCategoryId>
        <Rank>34277</Rank>
      </SalesRank>
    </SalesRankings>
  </Product>
</GetMatchingProductResult>
<ResponseMetadata>
  <RequestId>ea1cba87-6cfa-4c3e-bb4a-fea4531b3c8c</RequestId>
</ResponseMetadata>
</GetMatchingProductResponse>
EOD;
        return $response;

    }

}