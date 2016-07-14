<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="cover_content" id="cover_option">
    <a href="#" id="close" title="Close">�</a>
    <fieldset>
        <legend>Start Mining (Manual Configuration)</legend>
        Algorithm category:
        <div class="withPadding">
            <select id="algorithmcategories">
                <option value="">Select algorithm category</option>
            </select>
        </div>

        <div id="algorithmselection">
            Algorithm:
            <div class="withPadding">
                <select id="algorithmselectionoptions"></select>
            </div>
        </div>

        <div id="algorithmparameters">
            Parameters:
            <div id="algorithmparameterselection" class="withPadding"></div>
        </div>
    </fieldset>
</div>
