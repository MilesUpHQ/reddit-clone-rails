$(document).ready(function() {
    console.log("hello");
     $("#disclaimer").hide();
   $('#close-link').click(function(event){
     console.log("hi");
     $("#disclaimer").show();
     $("#comment-hide").hide();
     $("#close-link").hide();
     alert('The discussion is closed.No one able to comment on your discussion');
    event.preventDefault(); 
 });
});