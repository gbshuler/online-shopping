<div class="container">
	<div class="row">
		<!-- Divide horizontal bootstrap "12 grid" into 2+8+2 where right side is assumed 2 -->
		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Product Management</h4>
				</div>

				<div class="panel-body">
					<!-- FORM ELEMENTS -->

					<form class="form-horizontal">
						<div class="form-group">

							<label class="control-label col-md-4" for="name">Enter Product Name: </label>

							<div class="col-md-8">

								<input type="text" name="name" id="name"
									placeholder="Product Name" class="form-control">

							</div>
						</div>
						<div class="form-group">

							<label class="control-label col-md-4" for="brand">Enter
								Brand Name: </label>

							<div class="col-md-8">

								<input type="text" name="brand" id="brand"
									placeholder="Brand Name" class="form-control"> 

							</div>
						</div>						
						<div class="form-group">

							<label class="control-label col-md-4" 
							    for="description">Product Description: </label>

							<div class="col-md-8">
								<textarea name="description" id="description" rows="4" placeholder="Write a description"
									class="form-control"></textarea> 
							</div>
						</div>

						<div class="form-group">

							<label class="control-label col-md-4" for="unitPrice">Enter Unit Price: </label>

							<div class="col-md-8">

								<input type="text" name="unitPrice" id="unitPrice"
									placeholder="Unit Price" class="form-control"> 

							</div>
						</div>						
						<div class="form-group">

							<label class="control-label col-md-4" for="quantity">Quantity Available: </label>

							<div class="col-md-8">

								<input type="number" name="quantity" id="quantity"
									placeholder="Quantity Available" class="form-control"> 
							</div>
						</div>
						<div class="form-group">

							<label class="control-label col-md-4" for="categoryId">Select Category: </label>

							<div class="col-md-8">
								<select class="form-control" id="categoryId" name="categoryId">
									<option value="1">Laptop</option>
									<option value="2">Desktop</option>
									<option value="3">Laptop</option>
									<option value="4">Speakers</option>
								</select>
							</div>
						</div>
						<div class="form-group">

							<div class="col-md-offset-4 col-md-8">

								<input type="submit" name="submit" id="submit" value="Submit"
									class="btn btn-primary">

							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>