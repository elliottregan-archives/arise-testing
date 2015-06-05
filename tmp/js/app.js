var dependencies, mediaBrowser;

dependencies = [];

mediaBrowser = angular.module("mediaBrowser", dependencies);

angular.module("mediaBrowser").config(function() {
  console.log("configured");
});
