var path = require('path');
var babel = require('babel-loader');

module.exports = {
    entry: {
        app: './js/main.js'
    },
    output: {
        filename: './js/bin/[name].bundle.js',
        sourceMapFilename: './js/bin/[name].bundle.map'
    },
    devtool: '#source-map',
    module: {
        loaders: [
            {
                loader: 'babel',
                test: /\.jsx?$/,
                exclude: /(node_modules|bower_components)/,
                query: {
                    presets: ['es2015']
                }
            }
        ]
    },
    resolve: {
        root: path.resolve('./js'),
        extensions: ['', '.js']
    }
};