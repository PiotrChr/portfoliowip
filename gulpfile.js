var gulp = require('gulp');
var sass = require('gulp-sass');
var cleanCss = require('gulp-clean-css');

gulp.task('css', function() {
	return gulp.src('./css/scss/*.scss')
			.pipe(sass().on('error', sass.logError))
			.pipe(cleanCss({compatibility: 'ie9'}))
			.pipe(gulp.dest('./css/web'))
});

gulp.task('sass:watch', function () {
	gulp.watch('./css/scss/*.scss', ['sass']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['css']);
