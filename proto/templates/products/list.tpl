<!-- {$d = json_encode($products)}
{var_dump($d)} -->

{foreach $products as $prod}

    <div class="col-sm-4 col-lg-4 col-md-4">
        <div  class="thumbnail">
            <!-- <img src="http://placehold.it/320x150" alt=""> -->
            {if $prod.img }
                <a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}"> <img style="min-height:200px; max-height:200px; width:auto;" class="img-responsive" src="{$BASE_URL}images/products/{$prod.img}" alt=""> </a>
                {else}
                <a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}"> <img class="img-responsive" src="{$BASE_URL}images/products/default.png" alt=""> </a>
                {/if}

            <div class="caption">
                <h4 class="pull-right">€{$prod.price}</h4>
                {if (strlen($prod.title)>18)}
                <h4> <a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}">{substr($prod.title,0,18)}</a> </h4>
                {else}
                <h4> <a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}">{$prod.title}</a> </h4>
                {/if}
                
            </div>
            <div class="ratings">
                <p class="pull-right">15 reviews</p>
                <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                </p>
            </div>
        </div>
        <br>
    </div>
{/foreach}


{if isset($message)}

    <div class="col-sm-12 col-lg-12 col-md-12">
        {if $message != ""}
            <div class="row"></div>
        {/if}
        <h4 style="color:gray">{$message}</h4>
    </div>
{/if}