//	This javascript tags file downloads and external links in Google Analytics.
//	You need to be using the Google Analytics New Tracking Code (ga.js) 
//	for this script to work.
//	To use, place this file on all pages just above the Google Analytics tracking code.
//	All outbound links and links to non-html files should now be automatically tracked.
//
//	This script has been provided by Goodwebpractices.com
//	Thanks to ShoreTel, MerryMan and Colm McBarron
//
//	www.goodwebpractices.com
//	VKI has made changes as indicated below. 

if (document.getElementsByTagName) {
    var hrefs = document.getElementsByTagName("a");
    for (var l = 0; l < hrefs.length; l++) {
        try {
			var windowLocation = location.host.replace("www.","");
			var regExp = new RegExp("//(www.)?" + windowLocation + "($|/)");
			var isLocal = (hrefs[l].toString().substring(0,4) === "http") ? regExp.test(hrefs[l]) : false;
			//console.log(hrefs[l] + " - " + isLocal);
            if (hrefs[l].protocol == "mailto:") {
                startListening(hrefs[l], "click", trackMailto);
            } else if (isLocal) {
				// INTERNAL ONLY
                var path = hrefs[l].pathname + hrefs[l].search;
                var isDoc = path.match(/\.(?:doc|eps|jpg|png|svg|xls|ppt|pdf|xls|zip|txt|vsd|vxd|js|css|rar|exe|wma|mov|avi|wmv|mp3)($|\&|\?)/);
                if (isDoc) {
                    startListening(hrefs[l], "click", trackdownloadlLinks);
                }
            } else if (!hrefs[l].href.match(/^javascript:/)) {
				// EXTERNAL ONLY
                startListening(hrefs[l], "click", trackExternalLinks);
            }
        }
        catch (e) {
            continue;
        }
    }
}


function getFileExtension(path)
{
  var ext = /^.+\.([^.]+)$/.exec(path);
  return ext == null ? "" : ext[1].toUpperCase();
}


function startListening(obj, evnt, func) {
    if (obj.addEventListener) {
        obj.addEventListener(evnt, func, false);
    } else if (obj.attachEvent) {
        obj.attachEvent("on" + evnt, func);
    }
}

function trackMailto(evnt) {
	//console.log("this link is MAILTO");
    var href = (evnt.srcElement) ? evnt.srcElement.href : this.href;
    var mailto = "/mailto/" + href.substring(7);
    if (typeof (_gaq) == "object") _gaq.push(['_trackEvent', 'Mailto', 'Contact', href]);
	
}

function trackdownloadlLinks(evnt) {
    var e = (evnt.srcElement) ? evnt.srcElement : this;
    while (e.tagName != "A") {
        e = e.parentNode;
    }
    var lnk = (e.pathname.charAt(0) == "/") ? e.pathname : "/" + e.pathname;
    if (e.search && e.pathname.indexOf(e.search) == -1) lnk += e.search;
    //if (e.hostname != location.host) lnk = "/outboundl/" + e.hostname + lnk;
	var extension = e.pathname.split('.').pop();
	
	if (extension=="pdf") { // if pdf
		//console.log("this link is a pdf");
		if (typeof (_gaq) == "object") _gaq.push(['_trackPageview', lnk]);
	}
	else { // it NOT pdf
		//console.log("this link is NOT a pdf");
		if (typeof (_gaq) == "object") _gaq.push(['_trackEvent', 'Downloads', getFileExtension(lnk), lnk]);
	}

}

function trackExternalLinks(evnt) {
	//console.log("this link is EXTERNAL");
    var e = (evnt.srcElement) ? evnt.srcElement : this;
    while (e.tagName != "A") {
        e = e.parentNode;
    }
    var lnk = (e.pathname.charAt(0) == "/") ? e.pathname : "/" + e.pathname;
    if (e.search && e.pathname.indexOf(e.search) == -1) lnk += e.search;
    if (e.hostname != location.host) lnk =  e.hostname + lnk;
    if (typeof (_gaq) == "object") _gaq.push(['_trackEvent', 'Outbound Links', 'Clicks', lnk]);

}