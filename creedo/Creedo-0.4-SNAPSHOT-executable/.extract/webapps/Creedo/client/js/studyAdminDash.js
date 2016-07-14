var studySelector = $('#studySelect');
var generalInfoArea = $('#studyDashGeneralInfoArea');
var participantsInfoArea = $('#studyDashParticipantsInfoArea');


studySelector.change(function() {
    var value = studySelector.find(":selected").val();
    var studyId;
    $.get("studyAdminDash/studyGeneralInfo.htm", { "selectedStudyId" : value }, function(data){
        var studyGeneralInfo = JSON.parse(data);
        updateStudyGeneralInfoArea(studyGeneralInfo)
        studyId = studyGeneralInfo.id;
    });
    $.get("studyAdminDash/studyParticipantsInfo.htm", { "selectedStudyId" : value }, function(data){
        var participantsInfo = [];
        var jsonData = JSON.parse(data);
        for (var i = 0; i < jsonData.length; i++) {
            participantsInfo.push(JSON.parse(JSON.stringify(jsonData[i])));
        }
        updateParticipantsInfoArea(participantsInfo, studyId);
    });

});

function updateStudyGeneralInfoArea(studyGeneralInfo) {
    generalInfoArea.html('');
    generalInfoArea.append("<h3>Study Info</h3>" +
    "<table class=\"table table-hover\">" +
    "<thead><tr>" +
    "<th>Study logo</th>" +
    "<th>Study id</th>" +
    "<th>Study name</th>"+
    "</tr></thead>" +
    "<tbody><tr>" +
    "<td><img src=\"" + studyGeneralInfo.imageURL + "\" width=\"50px\"/></td>" +
    "<td>" + studyGeneralInfo.id + "</td>"+
    "<td>" + studyGeneralInfo.name + "</td>"+
    "</tbody></tr></table>");
}

function updateParticipantsInfoArea(participantsInfo, studyId) {
    var tableContent = "";
    participantsInfoArea.html('');
    for (var i = 0; i < participantsInfo.length; i++) {
        tableContent = tableContent.concat("<tr>");
        tableContent = tableContent.concat("<td>" + participantsInfo[i].userName + "</td>");
        tableContent = tableContent.concat("<td>" + participantsInfo[i].userId + "</td>");
        tableContent = tableContent.concat("<td>" + participantsInfo[i].assignmentGroupId + "</td>");
        tableContent = tableContent.concat("<td>");
        if (participantsInfo[i].participationFlag) {
            tableContent = tableContent.concat("<span class=\"glyphicon glyphicon-ok\"></span>");
        }
        tableContent = tableContent.concat("</td>");
        tableContent = tableContent.concat("<td><button class=\"btn btn-primary removeUserFromGroup\" studyid=\""+ studyId +"\" userid=\"" +
            participantsInfo[i].userId +"\" groupid=\""+ participantsInfo[i].assignmentGroupId+"\">Remove</button></td>");
    }

    participantsInfoArea.append("<h3>Participants Info</h3>" +
    "<table class=\"table table-hover\">" +
    "<thead><tr>" +
    "<th>Participant Name</th>" +
    "<th>Participant Id</th>" +
    "<th>AssignmentGroup Id</th>" +
    "<th>Has Participated</th>" +
    "<th>Remove</th>" +
    "</tr></thead>" +
    "<tbody>" +
    tableContent +
    "</tbody></table>");

}



$(document).on('click', '.removeUserFromGroup', function(e){
    e.preventDefault();
     var studyId = $(this).attr('studyid');
     var userId = $(this).attr('userid');
     var groupId = $(this).attr('groupid');

     $.post('removeUserFromGroup.htm',
     {
     studyId : studyId,
     userId : userId,
     groupId : groupId
     },
     function(removeOk) {
     alert("Server response: " + removeOk + " Reload to see changes in effect.");
     })
});



