$(document).ready(function(){
    $("#login_form").validate({
        rules:{
            j_username:{
               required:true,
            maxlength:12,
            minlength:3
            },
            j_password:{
                required:true,
            maxlength:12,
            minlength:3
            },
            
        }
    })
})