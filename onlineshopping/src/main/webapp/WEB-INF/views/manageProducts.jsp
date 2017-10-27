<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
 <div class="row">
  <c:if test="${not empty message}">
   <div class="col-xs-12">
    <div class="alert alert-success alert-dismissible">
     <button type="button" class="close" data-dismiss="alert">&times;</button>
     ${message}
    </div>
   </div>
  </c:if>

  <!-- Divide horizontal bootstrap "12 grid" into 2+8+2 where right side is assumed 2 -->
  <div class="col-md-offset-2 col-md-8">
   <div class="panel panel-primary">
    <div class="panel-heading">
     <h4>Product Management</h4>
    </div>

    <div class="panel-body">
     <!-- SPRING FORM ELEMENTS requires a modelAttribute to link form to a domain 
						 in our case this form maps to Product through Spring Form modelAttribute
						 Gotcha!  Need to add unused Product attributes as hidden fields (or they
						 will always be default values!  
          Note:  Most Spring Form forms use commandName attribute to bind to a server side object.
          -->
     <sf:form class="form-horizontal" modelAttribute="product"
      action="${contextRoot}/manage/products" 
      method="POST"
      enctype="multipart/form-data"
      >

      <div class="form-group">

       <label class="control-label col-md-4" for="name">Enter Product Name: </label>

       <div class="col-md-8">

        <!-- Note we changed HTML Friendly name="name" 
					                to SpringForm sf tag friendly path="name" -->
        <sf:input type="text" path="name" id="name" placeholder="Product Name"
         class="form-control" />
        <sf:errors path="name" cssClass="help-block" element="em" />
       </div>
      </div>
      <div class="form-group">

       <label class="control-label col-md-4" for="brand">Enter Brand Name: </label>

       <div class="col-md-8">

        <sf:input type="text" path="brand" id="brand" placeholder="Brand Name"
         class="form-control"></sf:input>
        <sf:errors path="brand" cssClass="help-block" element="em" />

       </div>
      </div>
      <div class="form-group">

       <label class="control-label col-md-4" for="description">Product
        Description: </label>

       <div class="col-md-8">
        <sf:textarea path="description" id="description" rows="4"
         placeholder="Write a description" class="form-control"></sf:textarea>
        <sf:errors path="description" cssClass="help-block" element="em" />
       </div>
      </div>

      <div class="form-group">

       <label class="control-label col-md-4" for="unitPrice">Enter Unit Price: </label>

       <div class="col-md-8">

        <sf:input type="number" path="unitPrice" id="unitPrice" placeholder="Unit Price"
         class="form-control"></sf:input>
        <sf:errors path="unitPrice" cssClass="help-block" element="em" />

       </div>
      </div>
      <div class="form-group">

       <label class="control-label col-md-4" for="quantity">Quantity Available: </label>

       <div class="col-md-8">

        <sf:input type="number" path="quantity" id="quantity"
         placeholder="Quantity Available" class="form-control"></sf:input>
       </div>
      </div>
      <!--  File element for loading an image file -->
      <div class="form-group">
         <label class="control-label col-md-4" for="file">Select an Image: </label>
         <div class="col-md-8">
            <sf:input type="file" path="file" id="file" class="form-control"/>
         </div>
      </div>
      <div class="form-group">

       <label class="control-label col-md-4" for="categoryId">Select Category: </label>

       <div class="col-md-8">
        <sf:select class="form-control" id="categoryId" path="categoryId"
         items="${categories}" itemLabel="name" itemValue="id" />
       </div>
      </div>
      <div class="form-group">

       <div class="col-md-offset-4 col-md-8">

        <input type="submit" name="submit" id="submit" value="Submit"
         class="btn btn-primary">


        <!-- 08:11 Part 05 - 02 
								   if you don't use hidden fields you will get default values
								   instead of original values -->
        <sf:hidden path="id" />
        <sf:hidden path="code" />
        <sf:hidden path="supplierId" />
        <sf:hidden path="active" />
        <sf:hidden path="purchases" />
        <sf:hidden path="views" />
       </div>
      </div>
     </sf:form>
    </div>
   </div>
  </div>
 </div>
</div>