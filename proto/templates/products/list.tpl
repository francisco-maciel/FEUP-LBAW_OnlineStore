

    {for $i=0 to (($products|@count)-1)}
            {$prod = $products[$i]}

    <div class="col-sm-4 col-lg-4 col-md-4">
        <div  class="thumbnail" id="{$prod.idproduct}">
            
            {if $prod.img }
                <a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}"> <img style="min-height:200px; max-height:200px; width:auto;" class="img-responsive" src="{$BASE_URL}images/products/{$prod.img}" alt=""> </a>
                {else}
                <a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}"> <img class="img-responsive" src="{$BASE_URL}images/products/default.png" alt=""> </a>
                {/if}

            <div class="caption">
                
                {if (strlen($prod.title)>28)}
                <h4> <a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}">{substr($prod.title,0,28)}</a> </h4>
                {else}
                <h4> <a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}">{$prod.title}</a> </h4>
                {/if}
                <h4 class="pull-right">€{$prod.price}</h4>
            </div>
            <div class="ratings">
                <p class="pull-right">{$productsRatings[$i]['numreviews']} reviews</p>
                <p>
                    {for $x=1 to intval($productsRatings[$i]['average'])}
                        <span class="glyphicon glyphicon-star"></span>
                    {/for}
                    {for $x=0 to 4-intval($productsRatings[$i]['average'])}
                        <span class="glyphicon glyphicon-star-empty"></span>
                    {/for}
                    {intval($productsRatings[$i]['average'])}
                </p>
            </div>
        </div>
        <br>
    </div>
{/for}


{if isset($message)}

    <div id="no_items_message" class="col-sm-12 col-lg-12 col-md-12">
        {if $message != ""}
            <div class="row"></div>
        {/if}
        <h4 style="color:gray">{$message}</h4>
    </div>
{/if}

