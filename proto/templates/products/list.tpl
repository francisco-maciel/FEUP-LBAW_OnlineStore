{foreach $products as $prod}

<div class="col-sm-4 col-lg-4 col-md-4">
	<div class="thumbnail">
		<img src="http://placehold.it/320x150" alt="">
		<div class="caption">
			<h4 class="pull-right">{$prod.price}</h4>
			<h4><a href="{$BASE_URL}pages/products/product.php?id={$prod.idproduct}">{$prod.title}</a>
			</h4>
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