//= require 'jquery-1.8.2'
//= require 'bootstrap'
//= require 'humane'
//= require 'jq-score-input'
//= require 'jquery.timeago'

$.timeago.settings.strings = {
  suffixAgo: "전",
  suffixFromNow: "후",
  seconds: "1분 이내",
  minute: "1분",
  minutes: "%d분",
  hour: "1시간",
  hours: "%d시간",
  day: "하루",
  days: "%d일",
  month: "한 달",
  months: "%d달",
  year: "1년",
  years: "%d년",
  wordSeparator: " "
};

$(document).ready(function() {
  $('abbr.timeago').timeago();
});
