[{oxstyle include=$oViewConf->getModuleUrl('sw_inserv/sw_lagerampel', 'out/src/css/ampel.css')}]
[{$smarty.block.parent}]
<div class="ampel_list">
    <div class="ampel_list_ig text-center">
        [{block name="details_productmain_stockstatus"}]
        [{if $product->getStockStatus() == -1}]
        <span class="stockFlag notOnStock">
            <i class="fa fa-circle text-danger"></i>
            [{if $product->oxarticles__oxnostocktext->value}]
            <link itemprop="availability" href="http://schema.org/OutOfStock"/>
            [{$product->oxarticles__oxnostocktext->value}]
            [{elseif $oViewConf->getStockOffDefaultMessage()}]
            <link itemprop="availability" href="http://schema.org/OutOfStock"/>
            [{oxmultilang ident="MASSAGE_NOT_ON_STOCK"}]
            [{/if}]
            [{if $product->getDeliveryDate()}]
        <link itemprop="availability" href="http://schema.org/PreOrder"/>
            [{oxmultilang ident="DETAILS_AVAILABLEON"}] [{$oDetailsProduct->getDeliveryDate()}]
            [{/if}]
        </span>
        [{elseif $product->getStockStatus() == 1}]
    <link itemprop="availability" href="http://schema.org/InStock"/>
        <span class="stockFlag lowStock">
            <i class="fa fa-circle text-warning"></i> [{oxmultilang ident="LOW_STOCK"}]
        </span>
        [{elseif $product->getStockStatus() == 0}]
        <span class="stockFlag">
            <link itemprop="availability" href="http://schema.org/InStock"/>
            <i class="fa fa-circle text-success"></i>
            [{if $oDetailsProduct->oxarticles__oxstocktext->value}]
            [{$oDetailsProduct->oxarticles__oxstocktext->value}]
            [{elseif $oViewConf->getStockOnDefaultMessage()}]
            [{oxmultilang ident="READY_FOR_SHIPPING"}]
            [{/if}]
        </span>
        [{/if}]
        [{/block}]
    </div>
</div>
