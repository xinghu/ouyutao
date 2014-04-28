$.fn.cycle.transitions.scrollFade = function($cont, $slides, opts) {
 $cont.css('overflow','visible').width();
 opts.before.push(function(curr, next, opts, fwd) {
     $.fn.cycle.commonReset(curr,next,opts);
         opts.cssBefore.opacity = 0;
         opts.cssBefore.left = fwd ? (next.cycleW-1) : (1-next.cycleW);
         opts.animOut.left = fwd ? -curr.cycleW : curr.cycleW;
     });
     opts.cssFirst = { left: 0 };
     opts.cssBefore= { top: 0, opacity: 0 };
     opts.animIn   = { left: 0, opacity: 1 };
     opts.animOut  = { top: 0, opacity: 0 };
};