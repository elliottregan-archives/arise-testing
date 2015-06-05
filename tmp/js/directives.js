angular.module("mysite").directive("clickAnywhereButHere", function($document) {
  return {
    restrict: "A",
    link: function(scope, elem, attr, ctrl) {
      elem.bind("touchstart", function(e) {
        e.stopPropagation();
      });
      elem.bind("click", function(e) {
        e.stopPropagation();
      });
      $document.bind("touchstart", function() {
        scope.$apply(attr.clickAnywhereButHere);
      });
      $document.bind("click", function() {
        scope.$apply(attr.clickAnywhereButHere);
      });
    }
  };
});

angular.module("mysite").directive("initFocus", function() {
  var timer;
  timer = void 0;
  return function(scope, elm, attr) {
    if (timer) {
      clearTimeout(timer);
    }
    timer = setTimeout(function() {
      elm[0].focus();
    }, 0);
  };
});

angular.module("mysite").directive('ngWebgl', function() {
  return {
    restrict: 'A',
    scope: {
      'width': '=',
      'height': '=',
      'n': '='
    },
    link: function(scope, element, attrs) {
      var Dodecahedron, animate, camera, cylinderMesh, geometry, init, material, mesh, mouse, objects, onDocumentMouseDown, polyhedronDataToMesh, projector, raycaster, renderer, scene;
      camera = void 0;
      scene = void 0;
      renderer = void 0;
      mesh = void 0;
      geometry = void 0;
      material = void 0;
      raycaster = void 0;
      mouse = void 0;
      objects = [];
      cylinderMesh = function(point1, point2, material) {
        var arrow, direction, edge, edgeGeometry, position, rotation;
        direction = (new THREE.Vector3).subVectors(point2, point1);
        arrow = new THREE.ArrowHelper(direction.clone().normalize(), point1);
        rotation = new THREE.Euler().setFromQuaternion(arrow.quaternion);
        edgeGeometry = new THREE.CylinderGeometry(2, 2, direction.length(), 8, 4);
        edge = new THREE.Mesh(edgeGeometry, material);
        position = new THREE.Vector3().addVectors(point1, direction.multiplyScalar(0.5));
        edge.position.set(position.x, position.y, position.z);
        edge.rotation.set(rotation.x, rotation.y, rotation.z);
        return edge;
        return scene.add(new THREE.ArrowHelper(direction.clone().normalize(), point1, direction.length()));
      };
      polyhedronDataToMesh = function(data) {
        var edgeAmalgam, edgeLine, edgeMaterial, i, lineAdded, polyhedron, spriteMaterial, vertex, vertexAmalgam, vertexGeometry, vertexMaterial, vertexSingleMesh;
        polyhedron = new THREE.Object3D;
        vertex = [];
        i = 0;
        while (i < data.vertex.length) {
          vertex.push(new THREE.Vector3(data.vertex[i][0], data.vertex[i][1], data.vertex[i][2]).multiplyScalar(100));
          i++;
        }
        vertexGeometry = new THREE.SphereGeometry(100, 12, 6);
        vertexSingleMesh = new THREE.Mesh(vertexGeometry);
        vertexMaterial = new THREE.MeshBasicMaterial({
          color: 0x000000,
          side: "front",
          opacity: 0.8
        });
        vertexAmalgam = new THREE.Geometry;
        edgeMaterial = new THREE.LineBasicMaterial({
          color: 0x000000,
          wireframe: true
        });
        edgeAmalgam = new THREE.Geometry;
        i = 0;
        spriteMaterial = new THREE.SpriteMaterial({
          color: 0x000000
        });
        console.log(data.vertex.length, data.edge.length, data.face.length);
        lineAdded = 0;
        data.edge.forEach(function(edgePair) {
          console.log("edgePair", edgePair);
          return data.face.forEach(function(faceVertices) {
            var index0, index1, isSuperset, particle1, particle2, results;
            console.log("faceVertices", faceVertices);
            i = 0;
            results = [];
            while (i < faceVertices.length) {
              console.log(JSON.stringify([edgePair[0], edgePair[1]]), JSON.stringify([faceVertices[i], faceVertices[i + 1]]));
              isSuperset = JSON.stringify([edgePair[0], edgePair[1]]) === JSON.stringify([faceVertices[i], faceVertices[i + 1]]);
              if (isSuperset) {
                console.log("isSuperset", isSuperset);
                particle1 = new THREE.Sprite();
                particle2 = new THREE.Sprite();
                index0 = edgePair[0];
                index1 = edgePair[1];
                particle1.position.x = data.vertex[index0][0];
                particle1.position.y = data.vertex[index0][1];
                particle1.position.z = data.vertex[index0][2];
                particle2.position.x = data.vertex[index1][0];
                particle2.position.y = data.vertex[index1][1];
                particle2.position.z = data.vertex[index1][2];
                particle1.position.normalize();
                particle2.position.normalize();
                particle1.position.multiplyScalar(200);
                particle2.position.multiplyScalar(200);
                scene.add(particle1);
                scene.add(particle2);
                edgeAmalgam.vertices.push(particle1.position);
                edgeAmalgam.vertices.push(particle2.position);
                lineAdded++;
                console.log("lineAdded", lineAdded);
              }
              results.push(i++);
            }
            return results;
          });
        });
        edgeLine = new THREE.Line(edgeAmalgam, edgeMaterial);
        console.log("edgeMesh", edgeLine);
        polyhedron.add(edgeLine);
        return polyhedron;
      };
      Dodecahedron = {
        "name": "Dodecahedron",
        "category": ["Platonic Solid"],
        "vertex": [[0, 0, 1.070466], [0.7136442, 0, 0.7978784], [-0.3568221, 0.618034, 0.7978784], [-0.3568221, -0.618034, 0.7978784], [0.7978784, 0.618034, 0.3568221], [0.7978784, -0.618034, 0.3568221], [-0.9341724, 0.381966, 0.3568221], [0.1362939, 1, 0.3568221], [0.1362939, -1, 0.3568221], [-0.9341724, -0.381966, 0.3568221], [0.9341724, 0.381966, -0.3568221], [0.9341724, -0.381966, -0.3568221], [-0.7978784, 0.618034, -0.3568221], [-0.1362939, 1, -0.3568221], [-0.1362939, -1, -0.3568221], [-0.7978784, -0.618034, -0.3568221], [0.3568221, 0.618034, -0.7978784], [0.3568221, -0.618034, -0.7978784], [-0.7136442, 0, -0.7978784], [0, 0, -1.070466]],
        "edge": [[0, 1], [0, 2], [0, 3], [1, 4], [1, 5], [2, 6], [2, 7], [3, 8], [3, 9], [4, 7], [4, 10], [5, 8], [5, 11], [6, 9], [6, 12], [7, 13], [8, 14], [9, 15], [10, 11], [10, 16], [11, 17], [12, 13], [12, 18], [13, 16], [14, 15], [14, 17], [15, 18], [16, 19], [17, 19], [18, 19]],
        "face": [[0, 1, 4, 7, 2], [0, 2, 6, 9, 3], [0, 3, 8, 5, 1], [1, 5, 11, 10, 4], [2, 7, 13, 12, 6], [3, 9, 15, 14, 8], [4, 10, 16, 13, 7], [5, 8, 14, 17, 11], [6, 12, 18, 15, 9], [10, 11, 17, 19, 16], [12, 13, 16, 19, 18], [14, 15, 18, 19, 17]]
      };
      init = function() {
        raycaster = new THREE.Raycaster;
        mouse = new THREE.Vector2;
        camera = new THREE.PerspectiveCamera(75, scope.width / scope.height, 1, 10000);
        camera.position.z = scope.width * 2;
        scene = new THREE.Scene;
        material = new THREE.MeshBasicMaterial({
          color: 0x000000,
          side: "front",
          wireframe: true,
          wireframeLinewidth: 1
        });
        if (scope.n === 3) {
          console.log("scope.n", scope.n);
          geometry = new THREE.TetrahedronGeometry(scope.width, 0);
          mesh = new THREE.Mesh(geometry, material);
        } else if (scope.n === 8) {
          geometry = new THREE.OctahedronGeometry(scope.width, 0);
          mesh = new THREE.Mesh(geometry, material);
        } else {
          console.log("Number of side is not supported. Defaulting to TetrahedronGeometry.");
          mesh = polyhedronDataToMesh(Dodecahedron);
        }
        mesh.position.set(0, 0, 0);
        scene.add(mesh);
        renderer = new THREE.WebGLRenderer({
          antialias: true
        });
        renderer.setSize(scope.width, scope.height);
        renderer.setClearColor(0xffffff, 1);
        element[0].appendChild(renderer.domElement);
      };
      animate = function() {
        requestAnimationFrame(animate);
        mesh.rotation.y += 0.025;
        renderer.render(scene, camera);
      };
      onDocumentMouseDown = function(event) {
        var intersects;
        event.preventDefault();
        mouse.x = event.clientX / renderer.domElement.width * 2 - 1;
        mouse.y = -(event.clientY / renderer.domElement.height) * 2 + 1;
        raycaster.setFromCamera(mouse, camera);
        intersects = raycaster.intersectObjects([mesh]);
        if (intersects.length > 0) {
          console.log(intersects[0].object);
          intersects[0].object.material.color.setHex(Math.random() * 0xffffff);
        }
      };
      init();
      animate();
      projector = new THREE.Projector;
      return document.addEventListener('mousedown', onDocumentMouseDown, false);
    }
  };
});
