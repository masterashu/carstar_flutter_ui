'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "737b76f5830bd96879ce64430a493cfb",
"assets/assets/fonts/Gilroy-ExtraBold.otf": "0f6e082f42f5247d82c3ade9c2a8f928",
"assets/assets/fonts/Gilroy-Light.otf": "c62aded729bf7146d491275e5019d7fc",
"assets/assets/icons/car.png": "ec4329c98227ba6e1039631c4ec27f24",
"assets/assets/icons/chair.png": "ee7def5f73767cde3d0c885f06529091",
"assets/assets/icons/dashboard.png": "4f269e6a9ff7eecf3bad4e0bbb197715",
"assets/assets/icons/engine.png": "2ab571bc9d10909aadd762adffac0425",
"assets/assets/icons/gas-station.png": "8be3617ee71c82d2fb4e65d53c741d02",
"assets/assets/icons/gearshift.png": "b8bfc5bf11e6bc969f5c14515068bd59",
"assets/assets/images/i8.png": "f438b4340a5b8b559c65cb9a07c9df76",
"assets/assets/images/logo.png": "9f76968b9a37f06ae1e5dc8e808c73c0",
"assets/assets/images/map.jpg": "4bc308a5854078c0c008b2039549f391",
"assets/assets/images/sonata.png": "1f5a88fc30cf052b767d954d7e381d92",
"assets/FontManifest.json": "8255c852a465309108223335f6e747d5",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "79243888b5aaced93be76c48b6bffed5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"index.html": "0432962905b9fc4f50aef70955991aa9",
"/": "0432962905b9fc4f50aef70955991aa9",
"main.dart.js": "6df88ebae47ef8bcd2986ab94b3eb20c"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
