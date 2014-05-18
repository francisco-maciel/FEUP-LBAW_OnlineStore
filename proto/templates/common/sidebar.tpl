{if isset($cat) }
<div class="col-md-3 column margintop20">
	<ul class="nav nav-pills nav-stacked">
		<li class="active">  <a href="#"><span class="glyphicon "></span> Filters</a></li>
		<li><a href="#"><span class="glyphicon glyphicon-chevron-down"></span> Brand</a></li>
		<li><a href="#"><span class="glyphicon "></span> Sony</a></li>
		<li><a href="#"><span class="glyphicon "></span> Samsung</a></li>
		<li><a href="#"><span class="glyphicon "></span> LG</a></li>

		<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Model</a></li>
		<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Price Limits</a></li>
		<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Others</a></li>
	</ul>
</div>

{elseif isset($dep)}

<div class="col-md-3 column margintop20">
	<ul class="nav nav-pills nav-stacked">
		<li class="active"><a><span class="glyphicon "></span> {$dep} </a></li>              
		{foreach $categories as $cat}
		<li><a href="{$BASE_URL}pages/products/search-prods.php?cat={$cat.id}"><span class="glyphicon glyphicon-chevron-right"></span> {$cat.name} </a></li>
		{/foreach} 
		<!--   { var_dump($departments) } -->
	</ul>
</div>

{else}

<div class="col-md-3 column margintop20">
	<ul class="nav nav-pills nav-stacked">
		<li class="active"><a><span class="glyphicon "></span> Departments </a></li>              
		{foreach $departments as $dep}
		<li><a href="{$BASE_URL}pages/products/search-prods.php?dep={$dep.iddepartment}"><span class="glyphicon glyphicon-chevron-right"></span> {$dep.name} </a></li>
		{/foreach} 
		<!--   { var_dump($departments) } -->
	</ul>
</div>

{/if}