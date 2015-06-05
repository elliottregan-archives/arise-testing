var gulp = require("gulp"),
    concat = require("gulp-concat"),
    jade = require("gulp-jade"),
    sass = require("gulp-sass"),
    coffee = require("gulp-coffee"),
    newer = require("gulp-newer"),
    nodemon = require("gulp-nodemon"),
    gutil = require("gulp-util"),
    sourcemaps = require("gulp-sourcemaps"),
    lr = require("gulp-livereload"),
    gulpif = require("gulp-if");

var SRC = 'src';
var DEST = 'tmp';
var dev = false;

gulp.task('dev', function() {
  dev = true;
  nodemon({
    script: 'server.js',
    nodeArgs: ['--harmony'],
    ext: 'js',
    ignore: ["tmp"]
  })
  .on('start', ['source', 'watch']);
});

gulp.task('source', ['templates','styles','images','scripts', 'angular','bower', 'fonts']);

gulp.task('watch', function() {
  gulp.watch(SRC+'/jade/*.jade', ['templates']);
  gulp.watch(SRC+'/sass/**/*.scss', ['styles']);
  gulp.watch(SRC+'/scripts/*.coffee', ['scripts']);
  gulp.watch(SRC+'/images/*.*', ['images']);

  gulp.watch(SRC+'/angular/*.coffee', ['angular-config']);
  gulp.watch(SRC+'/angular/controllers/*.coffee', ['angular-controllers']);
  gulp.watch(SRC+'/angular/directives/*.coffee', ['angular-directives']);
});

gulp.task('templates', function() {
  gulp.src('src/jade/*.jade')
    .pipe(newer(DEST))
    .pipe(jade({
      doctype: 'html',
      pretty: true,
      // debug: true,
      // compileDebug: true
    })).on('error', gutil.log)
    .pipe(gulp.dest(DEST))
    .pipe(gulpif(dev,lr()));
});

gulp.task('styles', function() {
  gulp.src('src/sass/main.scss')
    .pipe(newer(DEST+'/styles'))
    .pipe(sass({
      includePaths: require('node-neat').includePaths,
      loadPath: 'src/sass',
      errLogToConsole: true
    }))
    .pipe(gulp.dest(DEST+'/styles'))
    .pipe(gulpif(dev,lr()));
});

gulp.task('images', function() {
  gulp.src('src/images/*.*')
    .pipe(newer(DEST+'/images'))
    .pipe(gulp.dest(DEST+'/images'));
});

gulp.task('scripts', function() {
  gulp.src('src/scripts/*.coffee')
    .pipe(newer(DEST+'/js'))
    .pipe(concat('scripts.coffee'))
    .pipe(sourcemaps.init())
    .pipe(coffee({bare:true})).on('error', gutil.log)
    .pipe(gulp.dest(DEST+'/js'))
    .pipe(gulpif(dev,lr()));
});

gulp.task('angular', [
  'angular-config',
  'angular-controllers',
  'angular-directives'
]);

gulp.task('angular-config', function() {
  gulp.src([SRC+'/angular/app-init.coffee', SRC+'/angular/app-config.coffee'])
    .pipe(concat('app.coffee'))
    .pipe(coffee({bare:true})).on('error', gutil.log)
    .pipe(gulp.dest(DEST+'/js'))
    .pipe(gulpif(dev,lr()));
})

gulp.task('angular-controllers', function() {
  gulp.src([SRC+'/angular/controllers/*.coffee'])
    .pipe(concat('controllers.coffee'))
    .pipe(coffee({bare:true})).on('error', gutil.log)
    .pipe(gulp.dest(DEST+'/js'))
    .pipe(gulpif(dev,lr()));
})

gulp.task('angular-directives', function() {
  gulp.src([SRC+'/angular/directives/*.coffee'])
    .pipe(concat('directives.coffee'))
    .pipe(coffee({bare:true})).on('error', gutil.log)
    .pipe(gulp.dest(DEST+'/js'))
    .pipe(gulpif(dev,lr()));
})

gulp.task('bower', function() {
  gulp.src([
    // 'bower_components/jquery/dist/jquery.min.js',
    'bower_components/angular/angular.js',
    "bower_components/angular-animate/angular-animate.js",
    ])
    .pipe(concat('bower_components.js'))
    .pipe(gulp.dest(DEST+'/js'));
  gulp.src([
    // 'bower_components/jquery/dist/jquery.min.map',
    'bower_components/angular/angular.min.js.map',
    ])
    .pipe(gulp.dest(DEST+'/js'));
});

gulp.task('fonts', function() {
  gulp.src([
    'src/izicons/**/*'
    ])
    .pipe(gulp.dest(DEST+'/styles/izicons'));
});
