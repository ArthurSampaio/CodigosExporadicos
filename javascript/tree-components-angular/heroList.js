(function(angular) {
  'use strict';
function HeroListController($scope, $element, $attrs) {
  var ctrl = this;

  // This would be loaded by $http etc.
  ctrl.list = [
    {
      name: 'Superman',
      location: ''
    },
    {
      name: 'Batman',
      location: 'Wayne Manor'
    },
    { name: 'Picachu',
      location: 'Pedregal'
    }
  ];

  ctrl.updateHero = function(hero, prop, value) {
    hero[prop] = value;
  };

  ctrl.deleteHero = function(hero) {
    var idx = ctrl.list.indexOf(hero);
    if (idx >= 0) {
      ctrl.list.splice(idx, 1);
    }
  };
}

angular.module('heroApp').component('heroList', {
  templateUrl: 'heroList.html',
  controller: HeroListController
});
})(window.angular);

/*
Copyright 2017 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/