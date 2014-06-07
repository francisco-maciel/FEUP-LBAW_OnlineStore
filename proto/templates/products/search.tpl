{include file='common/header.tpl'}

<div class="container">

	<div class="row">
		<ol class="breadcrumb">
			<li><a href="{$BASE_URL}">Home</a></li>
			{if isset($search)}
			{if !empty($search)}
			<li class="active">Search: {$search}</li>
			{else}
			<li class="active">Search: All Products</li>
			{/if}
			{elseif isset($cat) }
			<li><a href="{$BASE_URL}pages/products/search-prods.php?dep={$depm.id}">{$depm.name}</a></li>
			<li class="active"><a href="{$BASE_URL}pages/products/search-prods.php?cat={$cat}">{$catname}</a></li>
			{else}
			<li class="active">{$dep}</li>
			{/if}
		</ol>
		
		{include file='common/sidebar.tpl'}

		<div class="col-md-9">
			<h3>Search Results</h3>
			<div id="results">
				
				{include file='products/list.tpl'}

			</div>

		</div>
		<div>
			<ul class="pagination">
			<!--
                                <li class="disabled"><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
                        -->
			</ul>
		</div>
	</div>

</div>

{include file='common/footer.tpl'}
<script src="{$BASE_URL}javascript/cart.js" ></script>
