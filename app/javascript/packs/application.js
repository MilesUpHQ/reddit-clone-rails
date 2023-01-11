// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import toastr from "toastr";
window.toastr = toastr;
import $ from "jquery";
import select2 from "select2";
import "select2/dist/css/select2.css";

require("turbolinks").start();

require("../includes/autocomplete");

// require("jquery/dist/jquery.min");
// require("select2/dist/js/select2.min");

require("@rails/activestorage").start();
require("channels");

require("bootstrap");

require("../includes/vote.js");
require("../includes/save_post.js");
require("../includes/backtotop.js");
require("../includes/infinitescroll.js");
require("../includes/navbar.js");
require("../includes/discussion.js");
require("../includes/comment_form.js");
require("../includes/notice.js");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix");
require("@rails/actiontext");
// require("../includes/autocomplete.js");
