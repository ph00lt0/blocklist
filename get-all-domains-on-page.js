// This script replaces the DOM of the webpage with all the domains linked.
// Useful for pages with GDPR violating consent opt outs, listing all parter tracking companies
// You may need to delete, or whitelist some domains, who are partners but are visted as social media sites.

var urls = document.querySelectorAll('a');
var domains = []
      
urls.forEach( url => {
   if (url.href) {
      var u = new URL( url.href.toString() );
      // Filter out domain currently viewing for internal links. 
      currentHost = location.host.match(/([^.]+)\.\w{2,3}(?:\.\w{2})?$/)
      if ( u.host.includes(currentHost[1]) ) {
        return
      }
    	domains.push(u.host)
   }
}); 

document.body.innerHTML = domains 
