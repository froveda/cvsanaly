(function(){var t;t=jQuery,t(document).ready(function(){return window.nestedFormEvents.insertFields=function(e,n,i){var o;return o=t(i).closest(".controls").siblings(".tab-content"),o.append(e),o.children().last()}}),t(document).on("nested:fieldAdded","form",function(e){var n,i,o,r,s,a;return i=e.field.addClass("tab-pane").attr("id","unique-id-"+(new Date).getTime()),r=t('<li><a data-toggle="tab" href="#'+i.attr("id")+'">'+i.children(".object-infos").data("object-label")+"</a></li>"),s=i.closest(".control-group"),n=s.children(".controls"),o=n.children(".nav"),e=s.children(".tab-content"),a=n.find(".toggler"),o.append(r),t(window.document).trigger("rails_admin.dom_ready"),r.children("a").tab("show"),o.select(":hidden").show("slow"),e.select(":hidden").show("slow"),a.addClass("active").removeClass("disabled").children("i").addClass("icon-chevron-down").removeClass("icon-chevron-right")}),t(document).on("nested:fieldRemoved","form",function(t){var e,n,i,o,r,s;return i=t.field,o=i.closest(".control-group").children(".controls").children(".nav"),n=o.children("li").has("a[href=#"+i.attr("id")+"]"),r=i.closest(".control-group"),e=r.children(".controls"),s=e.find(".toggler"),(n.next().length?n.next():n.prev()).children("a:first").tab("show"),n.remove(),0===o.children().length?(o.select(":visible").hide("slow"),s.removeClass("active").addClass("disabled").children("i").removeClass("icon-chevron-down").addClass("icon-chevron-right")):void 0})}).call(this);