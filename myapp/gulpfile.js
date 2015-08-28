var gulp = require('gulp');
var babelify = require('babelify');
var browserify = require('browserify');
var debowerify = require('debowerify');
var watchify = require('watchify');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var sourcemaps = require('gulp-sourcemaps');
var sass = require('gulp-sass');
var watch = require('gulp-watch');
var assign = require('lodash/object/assign');
var gutil = require('gulp-util');

var opts = assign({}, watchify.args, {
    entries: './src/FrontendBundle/Resources/public/lib/main.js',
    debug: true
});

var b = watchify(browserify(opts), { poll: true });

b.transform(babelify);
b.transform(debowerify);

function bundle() {
    return b
        .bundle()
        .pipe(source('main.js'))
        .pipe(buffer())
        .pipe(sourcemaps.init({ loadMaps: true }))
        .pipe(sourcemaps.write('./'))
        .pipe(gulp.dest('./web/js'))
        ;
}

b.on('update', bundle);
b.on('log', gutil.log);

gulp.task('scripts', bundle);
gulp.task('sass', function() {
    return gulp
        .src('./src/FrontendBundle/Resources/public/sass/**/*.scss')
        .pipe(sass())
        .pipe(gulp.dest('./web/css'))
        ;
});

gulp.task('watch', function() {
    watch('./src/FrontendBundle/Resources/public/sass/**/*.scss', { verbose: true, usePolling: true }, function() {
        gulp.start('sass');
    })
});

gulp.task('default', ['sass', 'scripts', 'watch']);
