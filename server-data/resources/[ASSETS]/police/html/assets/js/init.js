$(document).ready(function(){
  // LUA listener
  window.addEventListener('message', function( event ) {
    if (event.data.action == 'open') {
      // console.log(JSON.stringify(event.data.array['user']['gender']))
      var type        = event.data.type;
      var userData    = event.data.array['user'];
      var licenseData = event.data.array['licenses'];
      var sex         = userData['sex'];

        $('#name').css('color', '#282828');

        if ( sex.toLowerCase() == 'm' ) {
          $('#sex').text('male');
        } else {
          $('#sex').text('female');
        }

        $('#name').text(userData['firstname'] + ' ' + userData['lastname']);
        $('#dob').text(userData['dateofbirth']);
        $('#height').text(userData['height']);
        $('#signature').text(userData['firstname'] + ' ' + userData['lastname']);

        if ( type == 'driver' ) {
          if ( licenseData != null ) {
          Object.keys(licenseData).forEach(function(key) {
            var type = licenseData[key].type;

            if ( type == 'drive_bike') {
              type = 'bike';
            } else if ( type == 'drive_truck' ) {
              type = 'truck';
            } else if ( type == 'drive' ) {
              type = 'car';
            }

            if ( type == 'bike' || type == 'truck' || type == 'car' ) {
              $('#licenses').append('<p>'+ type +'</p>');
            }
          });
        }
          if (userData['pstate'] == 'lspd' || userData['pstate'] == null) {
                $('#id-card').css('background', 'url(assets/images/lspd.png)');
          }else if(userData['pstate'] == 'state') {
            $('#id-card').css('background', 'url(assets/images/state.png)');
          }else if(userData['pstate'] == 'ranger') {
            $('#id-card').css('background', 'url(assets/images/ranger.png)');
          }else if(userData['pstate'] == 'sheriff') {
            $('#id-card').css('background', 'url(assets/images/sheriff.png)');
          }
        } else {
          var userData    = event.data.array['user'];
          // $('#name').text(userData['firstname'] + ' ' + userData['lastname']);
          if (userData['pstate'] == 'lspd' || userData['pstate'] == null) {
            $('#id-card').css('background', 'url(assets/images/lspd.png)');
      }else if(userData['pstate'] == 'state') {
        $('#id-card').css('background', 'url(assets/images/state.png)');
      }else if(userData['pstate'] == 'ranger') {
        $('#id-card').css('background', 'url(assets/images/ranger.png)');
      }else if(userData['pstate'] == 'sheriff') {
        $('#id-card').css('background', 'url(assets/images/sheriff.png)');
      }
        }


      $('#id-card').show();
    } else if (event.data.action == 'close') {
      $('#name').text('');
      $('#dob').text('');
      $('#height').text('');
      $('#signature').text('');
      $('#sex').text('');
      $('#id-card').hide();
      $('#licenses').html('');
    }
  });
});
