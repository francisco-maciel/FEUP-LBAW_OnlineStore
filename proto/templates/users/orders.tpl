{foreach $myOrders as $myOrder}
    <tbody>
        <th>{$myOrder.idorder}</th>
        <th>{$myOrder.name}</th>
        <th>{$myOrder.date_placed}</th>
        <th>{$myOrder.date_shipped}</th>
        <th></th>
    </tbody>
{/foreach}

{if isset($message)}
    <div class="col-sm-12 col-lg-12 col-md-12">
        {if $message != ""}
            <div class="row"></div>
        {/if}
        <h4 style="color:gray">{$message}</h4>
    </div>
{/if}