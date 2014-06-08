
{include file='common/header.tpl'}

<div class="container">
    
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="{$BASE_URL}">Home</a></li>
			{if isset($search)}
                            {if $search == "no_term"}
                                <li class="active">Search: No term</li>
                                {$message = "You have not provided search term."}
                            {else}
                                <li class="active">Search: {$search}</li>
                            {/if}
			{elseif isset($cat) }
                            <li><a href="{$BASE_URL}pages/products/search-prods.php?dep={$depm.id}">{$depm.name}</a></li>
                            <li class="active"><a href="{$BASE_URL}pages/products/search-prods.php?cat={$cat}">{$catname}</a></li>
			{elseif isset($dep)}
                            <li class="active">{$dep}</li>
                        {else}
                            <li class="active">Search: All Products</li>
			{/if}
		</ol>
		{*include file='products/advanced_search.tpl'*}
		{include file='products/sidebar.tpl'}

		<div class="col-md-9">
			<h3>Search Results</h3>
			<div id="results">
				
				{include file='products/list.tpl'}

			</div>

		
                    <div class="col-md-9">
                        <div class="row text-center">
                            {if isset($pages)}
                                <ul class="pagination">
                                {if $pages > 1}
                               <!--     <li class="disabled"><a href="javascript:void(0)">&laquo;</a></li> -->
                                    <li class="active paginate_click" id="1-page"><a href="javascript:void(0)">1</a></li>
                                {for $i=2 to $pages}
                                    <li class="paginate_click" id="{$i}-page"><a href="javascript:void(0)">{$i}</a></li>
                                {/for}
                                 <!--   <li><a href="javascript:void(0)" class="paginate_click">&raquo;</a></li> -->
                                {/if}
                                </ul>
                            {/if}
                        </div>
                    </div>
                </div>
	</div>

</div>

{include file='common/footer.tpl'}


<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="{$BASE_URL}javascript/search.js"></script>
<script src="{$BASE_URL}javascript/cart.js" ></script>
