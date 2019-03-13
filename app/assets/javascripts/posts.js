document.addEventListener('DOMContentLoaded',function(){
  var title = document.querySelector('#post_title');
  var slug = document.querySelector('#post_slug');

  // Build a slug from the value of title
  function set_slug() {
    slug.value = title.value.replace(/\W/g,'-').toLowerCase();
  }

  // Set the slug on keyup events in Title...
  title.addEventListener('keyup',set_slug);

  // ...UNLESS you hear typing in the slug field,
  // then remove the event listener from title
  // AKA, no more auto-generating the slug
  slug.addEventListener('keyup', function(){
    title.removeEventListener('keyup',set_slug);
  });

});
