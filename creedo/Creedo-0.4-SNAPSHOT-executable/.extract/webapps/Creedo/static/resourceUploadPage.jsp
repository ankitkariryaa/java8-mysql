<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${uploadOk}">
    <div class="alert alert-info alert-dismissible col-xs-8 col-xs-offset-2" role="alert">
        <button type="button" class="close" data-dismiss="alert">
            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        </button>
        <strong>Status:</strong> ${uploadMsg}
    </div>
</c:if>

<!-- <div class="col-xs-8 col-xs-offset-2"> -->
    <form method="post" enctype="multipart/form-data" action="uploadResource.htm">
        <label for="fileUpload">Select files: </label>
        <input id="fileUpload" name="file" type="file" multiple>
        <input type="hidden" name="componentId" value="${componentId}">
        <input type="submit" class="btn btn-success">
    </form>
<!-- </div> -->