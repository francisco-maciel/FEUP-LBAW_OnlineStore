{include file='common/header.tpl'}

<div class="container">

	<div class="row">

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

		<div class="col-md-9">
			<div >
				<h3>Search Results</h3>

				{include file='products/list.tpl'}

			</div>
		</div>
	</div>
</div>

{include file='common/footer.tpl'}