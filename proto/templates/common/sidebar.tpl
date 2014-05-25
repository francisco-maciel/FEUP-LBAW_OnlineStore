{if isset($cat) }
<div id="aqui"></div>
<div class="col-md-3 column margintop20">
	<ul class="nav nav-pills nav-stacked">
		<li class="active">  <a><span class="glyphicon "></span> {$catname}</a></li>
		
		{for $i=0 to sizeof($filters)-1 }
		<li class="filter active2" id="filter{$filters[$i].id}" fid="{$filters[$i].id}"><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> {$filters[$i].name}</a></li>
                    {foreach $filtervalues[$i] as $fv}
                           {if $fv.type==0}
                        <li class="filterson filterclass"><a class="active_selected" href="#"><span class="glyphicon"></span>{$fv.value_string}</a></li>
                            {else}
                        <li class="filterson filterclass"><a class="active_selected" href="#"><span class="glyphicon"></span>{$fv.value_int}</a></li>
                            {/if}
                    {/foreach}
                {/for}
		<li class="filterson filterclass"><a class="active_selected" href="#"><span class="glyphicon"></span>ahsbcksaj</a></li>
		<!-- <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Others</a></li> -->
		<!-- {$filtervalues|@var_dump} -->
	</ul>
</div>

{elseif isset($dep)}

<div class="col-md-3 column margintop20">
	<ul class="nav nav-pills nav-stacked">
		<li class="active"><a><span class="glyphicon "></span> {$dep} </a></li>              
		{foreach $categories as $cat}
		<li><a href="{$BASE_URL}pages/products/search-prods.php?cat={$cat.id}"><span class="glyphicon glyphicon-chevron-right"></span> {$cat.name} </a></li>
		{/foreach}
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

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="{$BASE_URL}javascript/sidebar.js"></script>