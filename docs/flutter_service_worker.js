'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "b68f7ce524f51b69a4b46e8b64391446",
"assets/assets/fonts/SolanoGothicMVBStdBdCap.ttf": "c69042de5886bcdd621d2419607875d4",
"assets/assets/fonts/Zizou%2520Slab-BoldItalic.ttf": "671bf14b8325496aa9edc9fab21496c3",
"assets/assets/images/background/cafeteria.jpg": "0da7c5500235a6672d8f9ea0fde33c95",
"assets/assets/images/background/uni.jpg": "866c109c35c6f8288d8e4bc51099004e",
"assets/assets/images/landing/backgr4.jpg": "31dd7cc4b36ffbebbc87d544ff923224",
"assets/assets/images/landing/platforms.png": "ed5de5f671ab2d34be13219dfa92e402",
"assets/assets/images/logo/logotransparent.png": "9bc5d798597562f2496f0e38a4e47a05",
"assets/assets/images/logo/logotransparentcropped.png": "9e0364b1808420f66178bdf6c3c9d1b1",
"assets/assets/images/logo/logowhite.png": "5e0ed03853a56f5ab9b4bf0b587dc0c4",
"assets/FontManifest.json": "cdf17630b1df66a903a27e47eea9200b",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "89ccce1dfd2ea201733616a7ccfdd5da",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "f075cc23b1be37f77ee3fdceee534ec5",
"/": "f075cc23b1be37f77ee3fdceee534ec5",
"main.dart.js": "565a7ae269a2a8ccf18ebbc2e16f91ee",
"manifest.json": "0b2ef35dc07aebdbc45042c2268c3a3b"
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
